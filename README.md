# Translator App

## Описание

Translator App — это приложение для перевода текстов. Пользователи также могут просматривать историю своих преводов. 

## Установка и запуск

### Системные требования

- macOS или Windows
- Xcode (для macOS) или другой совместимый инструмент для сборки Swift приложений

### Сборка и запуск

1. **Клонируйте репозиторий:**

   git clone https://github.com/yourusername/your-repository.git

2. **Перейдите в директорию проекта:**

   cd your-repository

3. **Получите API-ключ для Unsplash:**

   Зарегистрируйтесь на rapidapi.com.
   Получите ваш API-ключ.

4. **Откройте проект в Xcode:**

   Запустите Xcode.
   Откройте файл .xcodeproj или .xcworkspace.

5. **Замените API-ключ в коде:**

   В файле NetworkService.swift замените строку
   
     private let requiredHeaders = "X-RapidAPI-Key": "YOUR_API_KEY_HERE"

   на ваш реальный API-ключ, полученный на шаге 3.

6. **Соберите и запустите проект:**

  Нажмите на кнопку "Run" в Xcode.



