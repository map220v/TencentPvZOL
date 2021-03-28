package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.utils.IDataInput;
   
   public final class Cmd_PlayZoneTask_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PlayZoneTask_CS";
      
      public static const PLAYZONETASK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PlayZoneTask_CS.playZoneTask","playZoneTask",1 << 3 | WireType.LENGTH_DELIMITED,Dto_PlayZoneTask);
       
      
      public var playZoneTask:Array;
      
      public function Cmd_PlayZoneTask_CS()
      {
         this.playZoneTask = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PlayZoneTask_CS.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.playZoneTask.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playZoneTask[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  this.playZoneTask.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlayZoneTask()));
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
