;; More about templates format: https://github.com/minad/tempel

org-mode

(day "
* "
(let ((day-of-week (ts-dow (ts-now))))

   (case day-of-week
     (0 "Воскресенье")
     (1 "Понедельник")
     (2 "Вторник")
     (3 "Среда")
     (4 "Четверг")
     (5 "Пятница")
     (6 "Суббота")))
"
** Важное
*** TODO Разбирать ZenMoney за обедом
*** TODO Анализировать проекты на Product Hunt
** Мои проекты

** Работа

** Прочее
")
