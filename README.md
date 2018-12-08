Android Repackaging Attack and Prevention.

This Repository will contain APK files for two different Android Projects.
1. Android APK with Malicious Code Injected.
2. Android APK with AspectJ(Inline Reference Monitor) Installed which will help the Android system to defend against that malicious code.

In order to Demonstration, 

//Attack
Step 1. Create Contacts, If there are no contacts.
Step 2. Install Attack.apk
Step 3. Open the "Attack" application, and also check your contacts if they are still there ot not.
Step 4. Restart yout device.
Step 5. Open you contacts. BOOOOM! Your contacts are deleted.

//Prevent
Step 6. Create contacts.
Step 7. Uninstall the "Attack.apk" and Reinstall "Prevent.apk"
Step 8. Open the APK.
Step 9. Restart the device.
Step 10. Check your contacts. They should be safe.

In order to Reverse Engineer, Malicious code Injection and Repackaging the application, follow below steps:

Reverse Engineering:
1. Download any apk from google store.
2. use APKTOOL to dissemble the "Applicaiton-apk" using "apktool d ****.apk".
3. This will create a folder, then relace the ".smali"(malicious) code inside the smali folder of disembled application folder.
*NOTE: You can dowload the malicious code from the SEEDLABS.
4. Rebuild the apk file from that folder using the coomand "apktool b <FOLDERNAME>"

Signing the apk:
Before starting the application, Make sure you have these tools - KeyTool and JarSigner.
5. Create a private key to sign the application using keytool.
keytool -alias <aliasName> -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000

6. Sign the apk using the private key which is generated(my-release-key.keystore) and JarSigner.
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore <application*apk> <aliasName>

7. Install the application. If youh have sny issues regarding "NO CERTIFICATES", delete the META-INF from the apk and redo step 5 and step 6.

For Prevention:

8. Develope an aspectJ file.
9. Use dex2jar(Download latest from google) to create jar file of an APK using the command: "sh d2j-dex2jar.sh -f -o (ApplicaitonName).apk".
10. This will create the jar file.
11. Now use ajc(AspectJ compiler) to weave aspectJ with the jar file. Here is the command: "ajc -cp ".:/usr/share/java/aspectjrt.jar" -inpath Vignan-dex2jar.jar (YourAspectFile).aj -outjar ModifiedFolder.jar -Xlint:ignore"
*NOTE: Do not use -Xlint:Ignore paramter, It ignore all the erros and warning and creates the JAR file. We used becuase, we got all useless warning, so we wanted to avoid those.
12. Now we will have ModifiedFile.jar, We will use jar2dex to create classes.dex from this modifiedJAR.
13. Create a copy of the Application, and we will replcae the Original Classes.dex with the Modified Classes.jar using the command "zip -r (YourApplication).apk classes.dex".
14. Now we have the modified APK.
15. Delete the META-INF from the APK.
16. Follow step 5 and step 6 for signing the apk.
17. Install the apk.
18. Attack and its prevention is successful.
