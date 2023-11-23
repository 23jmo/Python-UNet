# download using wget?

rm data/images/*
rm data/masks/*
rm data/test_images/*
rm data/test_masks/*

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1h73ST-Fu-cQq70K4k7zFIPGY3LsmBJJb' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1h73ST-Fu-cQq70K4k7zFIPGY3LsmBJJb" -O train_cp.zip && rm -rf /tmp/cookies.txt

unzip train_cp.zip

find train/ -type f -name '*img*' -exec mv {} data/images/ \;
find train/ -type f -name '*masks*' -exec mv {} data/masks/ \;
rm -d train
rm train_cp.zip

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1eUjrC9j-ABq4rSS1BJOdpSV7JDFbRuUB' -O test_cp.zip
unzip test_cp.zip

find test/ -type f -name '*img*' -exec mv {} data/test_images/ \;
find test/ -type f -name '*masks*' -exec mv {} data/test_masks/ \;
rm -d test
rm test_cp.zip

python scripts/preprocess_images.py

# remove the old .png images

rm data/masks/*.png
rm data/test_masks/*.png


