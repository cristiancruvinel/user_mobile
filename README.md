# 📱 User Mobile

Aplicativo Flutter desenvolvido como atividade prática para gerenciamento de usuários.  
O app permite **listar, cadastrar, editar e excluir** usuários com persistência local usando **SQFlite**, além de contar com **tema claro/escuro** com salvamento automático da preferência.

---

## ✨ Funcionalidades

- ✅ Cadastro local de usuários com nome e e-mail
- ✅ Listagem em cards modernos
- ✅ Edição de usuários com formulário reaproveitado
- ✅ Exclusão com confirmação
- ✅ Tema claro/escuro com botão de acessibilidade fixo
- ✅ Persistência de tema via `SharedPreferences`

---

## 🎥 Vídeo Demonstrativo

Assista à demonstração do app rodando no emulador:  
👉 [https://youtu.be/BTV8RZjFTxk](https://youtu.be/BTV8RZjFTxk)

---

## 🚀 Como Executar

> Requisitos:
- Flutter SDK instalado
- **Emulador Android ativo** ou dispositivo Android conectado

### Passos:

```bash
flutter pub get
flutter run
```

⚠️ **Atenção:**  
O app é voltado para Android. Certifique-se de iniciar um emulador antes de rodar o comando `flutter run`, ou conecte um dispositivo físico.

Para iniciar o emulador via terminal:

```bash
flutter emulators
flutter emulators --launch NOME_DO_EMULADOR
```

---

## 🛠️ Tecnologias Usadas

- **Flutter**
- **Dart**
- **SQFlite**
- **SharedPreferences**
- Design responsivo com Material 3

---

## 📁 Estrutura

```
lib/
├── database/        # DBHelper com SQFlite
├── models/          # Modelo User
├── pages/           # Listagem e formulário
├── themes/          # (reservado para customização futura)
└── main.dart        # Entry point com controle de tema
```

---

## 🧑‍💻 Autor

**Cristian Cauê Faria Cruvinel**  
[github.com/cristiancruvinel](https://github.com/cristiancruvinel)
