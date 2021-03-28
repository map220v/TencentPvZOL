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
   
   public final class Cmd_Mine_CancelMining_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_CancelMining_CS";
      
      public static const TARGETPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_CancelMining_CS.targetPos","targetPos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
       
      
      private var targetPos$field:Dto_WorldMap_Pos;
      
      public function Cmd_Mine_CancelMining_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_CancelMining_CS.$MessageID;
      }
      
      public function clearTargetPos() : void
      {
         this.targetPos$field = null;
      }
      
      public function get hasTargetPos() : Boolean
      {
         return this.targetPos$field != null;
      }
      
      public function set targetPos(param1:Dto_WorldMap_Pos) : void
      {
         this.targetPos$field = param1;
      }
      
      public function get targetPos() : Dto_WorldMap_Pos
      {
         return this.targetPos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTargetPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.targetPos$field);
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
                     throw new IOError("Bad data format: Cmd_Mine_CancelMining_CS.targetPos cannot be set twice.");
                  }
                  _loc3_++;
                  this.targetPos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.targetPos);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
