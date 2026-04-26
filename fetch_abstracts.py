import re
import json
import urllib.request
import urllib.parse
import ssl
from urllib.error import HTTPError

# Bypass SSL certificate verification
ssl_context = ssl._create_unverified_context()

# 1. Define file paths
bib_file_path = 'report/references.bib'
output_file_path = 'fetched_abstracts.txt'

# 2. Read the BibTeX file
with open(bib_file_path, 'r', encoding='utf-8') as f:
    bib_text = f.read()

# 3. Extract all Titles and Keys
# This matches title={...} or title="..."
entries = re.split(r'@\w+{', bib_text)
citations = []

for entry in entries:
    if not entry.strip():
        continue
    
    key_match = re.match(r'^([^,]+)', entry)
    if not key_match:
        continue
    cite_key = key_match.group(1).strip()
    
    title_match = re.search(r'title\s*=\s*[{"]([^}"]+)[}"]', entry, re.IGNORECASE)
    if title_match:
        title = title_match.group(1).strip()
        citations.append({'key': cite_key, 'title': title})

print(f"Found {len(citations)} references in {bib_file_path}. Fetching abstracts via Crossref...")

# 4. Query Crossref and write to output
with open(output_file_path, 'w', encoding='utf-8') as out_file:
    for cite in citations:
        title_query = urllib.parse.quote(cite['title'])
        # Crossref search API
        url = f"https://api.crossref.org/works?query.title={title_query}&rows=1"
        req = urllib.request.Request(url, headers={'User-Agent': 'mailto:academic_researcher@example.com'})
        
        try:
            with urllib.request.urlopen(req, context=ssl_context) as response:
                data = json.loads(response.read().decode('utf-8'))
                items = data.get('message', {}).get('items', [])
                
                if items:
                    item = items[0]
                    doi = item.get('DOI', 'No DOI found')
                    abstract = item.get('abstract', 'Abstract not provided in metadata.')
                    # Clean up XML/HTML tags
                    abstract_clean = re.sub(r'<[^>]+>', '', abstract)
                    
                    out_file.write(f"--- Key: {cite['key']} | DOI: {doi} ---\n")
                    out_file.write(f"Title: {cite['title']}\n")
                    out_file.write(f"Abstract: {abstract_clean}\n\n")
                    print(f"Successfully fetched: {cite['key']}")
                else:
                    out_file.write(f"--- Key: {cite['key']} ---\nTitle: {cite['title']}\nResult: No match found on Crossref.\n\n")
                    print(f"No match found: {cite['key']}")
                
        except HTTPError as e:
            out_file.write(f"--- Key: {cite['key']} ---\nFailed to fetch API data (HTTP {e.code}).\n\n")
            print(f"Failed to fetch: {cite['key']}")
        except Exception as e:
            print(f"Error processing {cite['key']}: {str(e)}")

print(f"\nFinished. Results compiled into {output_file_path}")
