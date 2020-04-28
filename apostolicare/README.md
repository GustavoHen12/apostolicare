# Mobile Documentation

A new Flutter project.

## Preparando o ambiente

Pra preparar o ambiente, basicamente tudo o que é necessário saber tem na documentação do flutter: https://flutter.dev/docs/get-started/install/windows

#### Caso encontre problemas ao rodar o comando `flutter doctor`, consulte o link abaixo
* https://stackoverflow.com/questions/49609889/flutter-doctor-doesnt-work-on-neither-command-prompt-or-powershell-window

As etapas que foram mais chatinhas para mim, foram as relacionadas ao Android Studio, então vou deixar esses links que me ajudaram: 
* https://www.youtube.com/watch?v=Em8igImhBKc, https://medium.com/flutter-comunidade-br/como-instalar-flutter-e-android-studio-no-ubuntu-18-04-lts-1338d7bd2d6b
* https://www.youtube.com/watch?v=frrUB8pEIng (pode ser útil para Windows)

Para rodar o aplicativo você terá a opção de configurar um emulador no Android Studio ou utilizar seu prórpio celular. Para a primeira opção, no site do próprio Android Studio tem um tutorial de como configurar e instalar (https://developer.android.com/studio/run/managing-avds). Já para a segunda opção, basta alterar a configuração do seu smartphone. É importante lembrar que rodar o emulador pode ser um pouco pesado, então pode dar umas travadas as vezes.

Após instalar o flutter e o Android Studio, será necessário configurar o editor de texto. Eu recomendo utilizar o VSCode. O tutorial do flutter está neste link: https://flutter.dev/docs/get-started/editor?tab=vscode

Com relação aos packages extras que o projeto está utilizando:
  
  * Para o ícone, https://medium.com/@psyanite/how-to-add-app-launcher-icons-in-flutter-bd92b0e0873a
  
  * Para o armazenamento, https://flutter.dev/docs/cookbook/persistence/key-value
  
  Como o `pubspec.yaml` já está configurado, os únicos comando que será necessário rodar no terminal são para instalar o laucher icons: `flutter packages get` e `flutter packages pub run flutter_launcher_icons:main`
  
  
#### Considerações finais:
  Principalmente para iniciar o dispositivo na primeira vez, pode ser um pouco demorado.
  Para criar um novo projeto também é um pouco demorado, mas não será necessário criar um novo.
