# nova-iOS
nova-iOS

02_02_2022 

Parte 1: 
  - introducción al lenguaje Swift - myPlayground.swift

Parte 2: 
  - mi primera app
  - introducción a xCode IDE de trabajo

03_02_2022 

parte 3:
  - MyDayPickerApp:
    + textFieldAction onEnded con #selector 
    + combinadores raiz: tab (Tab Bar) / nav (navigationCotroller) / table (table View)
    + dateAndTime pickerView
    + UIPickerView en second VC + asignación e implementación de las extensiones picker.dataSource y picker.delegate.
    
      dataSource [numberOfComponents, numberOfRowsInComponent]
      delegate [titleForRow, rowHeightForComponent, didSelectRow]
      
    + UIPickerView por storyBoard/xib y por código 

07_02_2022

Parte 2:
  - AlertsApp:
    + UI AlertController: Simple, TextField, LoginForm, Multiple Buttons
    + UI ActionSheet Standard
    + Navegación: segue, code

08_02_2022

Parte 1:
- AppIntroTableView:
  + AppCoordinator
  + Arquitectura de carpetas: 
  Modules [Sections[Detail, Master[Cell]]], CoreApp []
  + tableView implementación Básica:
      1 crear array con datos en tVC (DataSource).
      2 asignar delegado(TableViewDelegate) y fuente de datos(TableViewDataSource) a self.
      3 crear VC extension para el delegado (UITableViewDelegate) + implementar: tableView(didSelectRow).
      4 crear VC extension para la fuente de datos (TableViewDataSource) + implementar: numberOfRowInSections, tableView(numberOfRowsInSection y cellForRowAt).
      5 crear celda (.swift + .xib).
      6 registrar la celda(nib + forCellReuseIdentifier) en tVC después de asignar delegado y fuente de datos.
      7 crear celda en método cellForRowAt.
  + DTOpattern en DetailCoordinator


tracking sheet (Ask for access): https://docs.google.com/spreadsheets/d/1eUYuaQPKfVGLa_pjcSa-LEiiuAXbY2ALMMXQ9dOrotU/edit?usp=sharing
