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
"
(let ((day-of-week (ts-dow (ts-now))))

   (case day-of-week
     (1 "
*** TODO Разбирать ZenMoney за обедом
")))

"
** Мои проекты

** Работа

** Прочее
")
