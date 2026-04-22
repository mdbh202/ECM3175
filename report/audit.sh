#!/bin/bash
# LaTeX Technical Auditor for ECM3175 Final Report
# Performs pre-build linting, asset verification, and post-build log analysis.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}--- Starting LaTeX Technical Audit ---${NC}"

# 1. Linting with chktex
echo -e "\n${YELLOW}Step 1: Running chktex linting...${NC}"
find . -name "*.tex" -not -path "./out/*" | while read -r file; do
    echo "Checking $file..."
    chktex -q -n1 -n3 -n8 -n36 "$file" # Suppress some minor warnings (command spacing, etc.)
done

# 2. Asset Verification
echo -e "\n${YELLOW}Step 2: Verifying Image Assets...${NC}"
MISSING_ASSETS=0
# Extract image names from all .tex files
IMAGES=$(grep -r "\\\\includegraphics" . --include="*.tex" -h | sed -E 's/.*\\includegraphics(\[[^]]*\])?\{([^}]+)\}.*/\2/')

for img in $IMAGES; do
    # Try different extensions if not specified
    FOUND=false
    for ext in "" ".png" ".pdf" ".jpg" ".jpeg" ".webp"; do
        if [ -f "figures/$img$ext" ]; then
            FOUND=true
            break
        fi
    done
    
    if [ "$FOUND" = false ]; then
        echo -e "${RED}Error: Missing asset 'figures/$img' referenced in source.${NC}"
        MISSING_ASSETS=$((MISSING_ASSETS + 1))
    fi
done

if [ $MISSING_ASSETS -eq 0 ]; then
    echo -e "${GREEN}All referenced assets found in figures/ directory.${NC}"
else
    echo -e "${RED}Found $MISSING_ASSETS missing assets. Please fix before submission.${NC}"
fi

# 3. Compilation
echo -e "\n${YELLOW}Step 3: Compiling Document...${NC}"
./build.sh > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo -e "${RED}Fatal Error: Compilation failed. Check out/main.log for details.${NC}"
    exit 1
fi

# 4. Log Analysis
LOG="out/main.log"
echo -e "\n${YELLOW}Step 4: Analyzing Compilation Logs...${NC}"

UNDEF_CITATIONS=$(grep -c "Warning: Citation.*undefined" "$LOG" || true)
UNDEF_REFS=$(grep -c "Warning: Reference.*undefined" "$LOG" || true)
OVERFULL_HBOX=$(grep -c "Overfull \\\\hbox" "$LOG" || true)
UNDERFULL_HBOX=$(grep -c "Underfull \\\\hbox" "$LOG" || true)

echo -e "--- Audit Summary ---"
if [ "$UNDEF_CITATIONS" -gt 0 ]; then
    echo -e "${RED}Undefined Citations: $UNDEF_CITATIONS${NC}"
    grep "Warning: Citation.*undefined" "$LOG"
else
    echo -e "${GREEN}Undefined Citations: 0${NC}"
fi

if [ "$UNDEF_REFS" -gt 0 ]; then
    echo -e "${RED}Undefined References: $UNDEF_REFS${NC}"
    grep "Warning: Reference.*undefined" "$LOG"
else
    echo -e "${GREEN}Undefined References: 0${NC}"
fi

if [ "$OVERFULL_HBOX" -gt 0 ]; then
    echo -e "${YELLOW}Overfull \hbox: $OVERFULL_HBOX (Margin overflows)${NC}"
else
    echo -e "${GREEN}Overfull \hbox: 0${NC}"
fi

if [ "$UNDERFULL_HBOX" -gt 0 ]; then
    echo -e "${YELLOW}Underfull \hbox: $UNDERFULL_HBOX (Spacing gaps)${NC}"
else
    echo -e "${GREEN}Underfull \hbox: 0${NC}"
fi

echo -e "\n${GREEN}Audit complete.${NC}"
