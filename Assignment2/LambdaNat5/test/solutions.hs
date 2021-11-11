-- member
member :: Int -> [Int] -> Int
member n [] = 0
member n (m : ms) = if n == m then 1 else (member n ms) 

-- remove
remove :: Int -> [Int] -> [Int]
remove n [] = []
remove n (m:ms) = if n == m then ms else m : (remove n ms)

-- sum
esum :: [Int] -> Int
esum [] = 0
esum (n:ns) = n + (esum ns)

-- prod
eprod :: [Int] -> Int
eprod [] = 0
eprod (n:[]) = n
eprod (n:ns) = n * (eprod ns)

-- plus_two
plus_two :: Int -> Int
plus_two n = n + 2;

-- map
emap :: (Int -> Int) -> [Int] -> [Int]
emap f [] = []
emap f (n:ns) = (f n) : (emap f ns)


-- insert
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys) = if x < y
    then x : y : ys
    else y : insert x ys 


-- sort
sort :: [Int] -> [Int]
sort [m] = [m]
sort (m : ms) = insert m (sort ms)


--main
main = do

    print $ member 1 ([2, 3, 1])

    print $ remove 3 ([1,2,3,1,2,3]);

    print $ esum ([1,2,3,4])

    print $ eprod ([1,2,3,4])

    print $ plus_two 2

    print $ emap (plus_two) ([4,3,2,1])

    print $ insert 3 ([1,2,3,1,2,3])

    print $ sort ([1,2,3,1,2,3])