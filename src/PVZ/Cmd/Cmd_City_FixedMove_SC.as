package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_City_FixedMove_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_FixedMove_SC";
      
      public static const AREA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_City_FixedMove_SC.area","area",1 << 3 | WireType.VARINT);
      
      public static const NEWPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_City_FixedMove_SC.newPos","newPos",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
       
      
      private var area$field:int;
      
      private var hasField$0:uint = 0;
      
      private var newPos$field:Dto_WorldMap_Pos;
      
      public function Cmd_City_FixedMove_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_FixedMove_SC.$MessageID;
      }
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967294;
         this.area$field = new int();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set area(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.area$field = param1;
      }
      
      public function get area() : int
      {
         return this.area$field;
      }
      
      public function clearNewPos() : void
      {
         this.newPos$field = null;
      }
      
      public function get hasNewPos() : Boolean
      {
         return this.newPos$field != null;
      }
      
      public function set newPos(param1:Dto_WorldMap_Pos) : void
      {
         this.newPos$field = param1;
      }
      
      public function get newPos() : Dto_WorldMap_Pos
      {
         return this.newPos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.area$field);
         }
         if(this.hasNewPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.newPos$field);
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
                     throw new IOError("Bad data format: Cmd_City_FixedMove_SC.area cannot be set twice.");
                  }
                  _loc3_++;
                  this.area = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_FixedMove_SC.newPos cannot be set twice.");
                  }
                  _loc4_++;
                  this.newPos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.newPos);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
