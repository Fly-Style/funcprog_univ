module Main where

import Control.Exception
import Database.HDBC
import Database.HDBC.PostgreSQL (connectPostgreSQL)
import Sport
import Teacher
import Section
-- import Schedule

main = do
    c <- connectPostgreSQL "host=localhost dbname=postgres user=flystyle password=password"

    putStrLn " -- STUDENTS -- "

    result0 <- readAll c
    putStrLn $ show result0
    result00 <- readUser c 1
    putStrLn $ show result00
    result000 <- createUser "Bambito" "Liderito" 2 c
    putStrLn $ show result000
    result0000 <- updateUser 3 "Lolipop" "Kekovich" 2 c
    putStrLn $ show result0000
    result00 <- readUser c 1
    putStrLn $ show result00

    ---
    putStrLn " -- TEACHERS -- "
    ---

    result11 <- readAllTeachers c
    putStrLn $ show result11
    result22 <- readTeacher c 1
    putStrLn $ show result22
    result33 <- createTeacher "Kyle" "Superuser"  c
    putStrLn $ show result33
    result44 <- updateTeacher 3 "Super" "Boxer" c
    putStrLn $ show result44
    result22 <- readTeacher c 1
    putStrLn $ show result22

    ---
    putStrLn " -- SECTIONS -- "
    ---

    result1 <- readAllSections c
    putStrLn $ show result1
    result2 <- readSection c 1
    putStrLn $ show result2
    result3 <- createSection "Neur" 2 c
    putStrLn $ show result3
    result4 <- updateSection 3 "Neurons" 2 c
    putStrLn $ show result4
    result2 <- readSection c 1
    putStrLn $ show result2


    commit c
    disconnect c
    return ()