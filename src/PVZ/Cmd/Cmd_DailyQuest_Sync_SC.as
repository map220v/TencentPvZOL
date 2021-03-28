package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_DailyQuest_Sync_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyQuest_Sync_SC";
      
      public static const DAILYQUEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyQuest_Sync_SC.dailyquest","dailyquest",1 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyQuest);
       
      
      private var dailyquest$field:Dto_DailyQuest;
      
      public function Cmd_DailyQuest_Sync_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyQuest_Sync_SC.$MessageID;
      }
      
      public function clearDailyquest() : void
      {
         this.dailyquest$field = null;
      }
      
      public function get hasDailyquest() : Boolean
      {
         return this.dailyquest$field != null;
      }
      
      public function set dailyquest(param1:Dto_DailyQuest) : void
      {
         this.dailyquest$field = param1;
      }
      
      public function get dailyquest() : Dto_DailyQuest
      {
         return this.dailyquest$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasDailyquest)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dailyquest$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyQuest_Sync_SC.dailyquest cannot be set twice.");
                  }
                  _loc3_++;
                  this.dailyquest = new Dto_DailyQuest();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.dailyquest);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
