module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where

import Data.IORef 

data BankAccount = BankAccount { currentBalance :: IORef (Maybe Integer) }

openAccount :: IO BankAccount
openAccount = newIORef (Just 0) >>= \balance -> return (BankAccount balance)

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance = readIORef . currentBalance

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance acc@(BankAccount balance) amount =
  atomicModifyIORef' balance (\b -> (fmap (+ amount) b, Nothing)) >> getBalance acc

closeAccount :: BankAccount -> IO ()
closeAccount (BankAccount balance) = atomicWriteIORef balance Nothing
