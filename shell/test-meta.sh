#!/bin/bash
# metaprogram
echo '#!/bin/bash' > test-meta-gen.sh
for ((I=1; I<=92; I++)) do
    echo "echo $I" >> test-meta-gen.sh
done
chmod +x test-meta-gen.sh