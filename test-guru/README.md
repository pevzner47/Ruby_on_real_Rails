# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Приложение TestGuru

Основные сущности:
1. Тест
2. Пользователь

Пользователь делится на админов и обычных пользователей
  Обычный
    Может выбрать тест (если есть доступ) и пройти его
    Возможно, у него будет какая то статистика "Успеваемость"
    Кроме того, у пользователя должен быть userID и login и пороль с которыми он заходит в систему
  Админ
    Помимо всех свойств пользователя должен уметь:
      Создовать и изменять тесты
      Открывать/закрывать доступ к тестам

Тест
  Состоит из Вопросов
  Его можно изменять админу
