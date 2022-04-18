# create keystore

# create a folder keys before running the commands  
keytool -genkey -v -keystore ./keys/release.jks \
-keyalg RSA \
-keysize 2048 \
-validity 10000 \
-alias release-key



# ourapp

#password: 0ur@pp2022

#list /describe keystore
keytool -list -v -keystore ./keys/release.jks \
 -alias release-key \
 -storepass  0ur@pp2022 \
 -keypass  0ur@pp2022 