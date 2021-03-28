package PVZ.Cmd
{
   public final class FriendOperationStatus
   {
      
      public static const FRIEND_OPERATION_STATUS_ENABLE:int = 1;
      
      public static const FRIEND_OPERATION_STATUS_STEAL:int = 2;
      
      public static const FRIEND_OPERATION_STATUS_CULTIVATE:int = 4;
      
      public static const FRIEND_OPERATION_STATUS_PRESENT_ENERGY:int = 8;
      
      public static const FRIEND_OPERATION_STATUS_TAKE_ENERGY:int = 16;
      
      public static const FRIEND_OPERATION_STATUS_FIGHT:int = 32;
      
      public static const FRIEND_OPERATION_STATUS_RETURN_ENERGY:int = 64;
      
      public static const FRIEND_OPERATION_STATUS_NOT_RECV_ENERGY:int = 128;
       
      
      public function FriendOperationStatus()
      {
         super();
      }
   }
}
