module BasicFunctions(fac,replicate',take',reverse',repeat',zip',elem,quicksort,maximum,minimum) where
    -----------------------------------------------------------------------------------------------------------------
    -- CALCULATING THE FACTORIAL OF A NUMBER
    -----------------------------------------------------------------------------------------------------------------
    fac n = if n < 2 then 1 else n * fac (n-1)
    -----------------------------------------------------------------------------------------------------------------
    --CREATE A LIST THAT HAS NUMBER X N TIMES
    -----------------------------------------------------------------------------------------------------------------
    replicate' :: (Num i, Ord i) => i -> a -> [a]  
    replicate' n x  
        | n <= 0    = []  
        | otherwise = x:replicate' (n-1) x

    -----------------------------------------------------------------------------------------------------------------
    --CREATING A SUBLIST CONTAINING ALL ELEMENTS GREATER THAN THE ONE PASSED AS A PARAMETER
    -----------------------------------------------------------------------------------------------------------------
    take' :: (Num i, Ord i) => i -> [a] -> [a]  
    take' n _  
        | n <= 0   = []  
    take' _ []     = []  
    take' n (x:xs) = x : take' (n-1) xs 

    -----------------------------------------------------------------------------------------------------------------
    --REVERSES A LIST
    -----------------------------------------------------------------------------------------------------------------
    reverse' :: [a] -> [a]  
    reverse' [] = []  
    reverse' (x:xs) = reverse' xs ++ [x]
    -----------------------------------------------------------------------------------------------------------------
    --CREATES A LIST CONTAINING NUMBER X INFINITE TIMES
    -----------------------------------------------------------------------------------------------------------------
    repeat' :: a -> [a]  
    repeat' x = x:repeat' x 
    -----------------------------------------------------------------------------------------------------------------
    --ZIPPING 2 LISTS TOGETHER
    -----------------------------------------------------------------------------------------------------------------
    zip' :: [a] -> [b] -> [(a,b)]  --zipping 2 lists together
    zip' _ [] = []  
    zip' [] _ = []  
    zip' (x:xs) (y:ys) = (x,y):zip' xs ys  
    -----------------------------------------------------------------------------------------------------------------
    --CHECKS IF AN ELEMENT IS IN A LIST
    -----------------------------------------------------------------------------------------------------------------
    elem' :: (Eq a) => a -> [a] -> Bool  --checks if an element is in a list
    elem' a [] = False  
    elem' a (x:xs)  
        | a == x    = True  
        | otherwise = a `elem'` xs  

    -----------------------------------------------------------------------------------------------------------------
    -- SORTING THE ELEMENTS OF A LIST
    -----------------------------------------------------------------------------------------------------------------
    quicksort :: (Ord a) => [a] -> [a]  --sorting elements in a list
    quicksort [] = []  
    quicksort (x:xs) =   
        let smallerSorted = quicksort [a | a <- xs, a <= x]  
            biggerSorted = quicksort [a | a <- xs, a > x]  
        in  smallerSorted ++ [x] ++ biggerSorted