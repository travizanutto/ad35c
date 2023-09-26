# vwalltet
Projeto desenvolvido para a disciplina AD35C ministrado pelo prof. Diego Antunes na UTFPR/PG.  
### Desenvolvido por:  
Augusto Padilha  
Cainan Travizanutto  
Caio Furlan  
### Funcionalidades
- Gerenciar cartões, gastos e entradas.
- Cada cartão tem uma lista de transações.
- Gerenciar as transações de cada cartão.
### TODO
- Exibição de gastos e entradas.
- Desenvolvimento estético afim de embelezar e trazer originalidade ao app.
- Filtrar as listas, falta de campos de busca também.
- Apenas a parte de controle usuário está bem comentada.
- Detectar a bandeira do cartão.
- Verficações mais fortes nos formulários.
- ✨DATABASES✨

## Building
### Requerimentos
- Dart 3.0.6
- Flutter 3.10
```bash
git clone https://github.com/travizanutto/ad35c.git
cd ad35c
flutter pub get
flutter build apk

```
O apk compilado estará no diretório 
```
├── build
    ├── app
        ├── outputs
            ├── flutter-apk
                └── app-release.apk
```
