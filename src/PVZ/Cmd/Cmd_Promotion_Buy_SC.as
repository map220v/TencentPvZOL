package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Promotion_Buy_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Promotion_Buy_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Promotion_Buy_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const ITEMS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Promotion_Buy_SC.items","items",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      public var activityId:uint;
      
      private var items$field:Dto_IdNum;
      
      public function Cmd_Promotion_Buy_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Promotion_Buy_SC.$MessageID;
      }
      
      public function clearItems() : void
      {
         this.items$field = null;
      }
      
      public function get hasItems() : Boolean
      {
         return this.items$field != null;
      }
      
      public function set items(param1:Dto_IdNum) : void
      {
         this.items$field = param1;
      }
      
      public function get items() : Dto_IdNum
      {
         return this.items$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityId);
         if(this.hasItems)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Promotion_Buy_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Promotion_Buy_SC.items cannot be set twice.");
                  }
                  _loc4_++;
                  this.items = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.items);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
