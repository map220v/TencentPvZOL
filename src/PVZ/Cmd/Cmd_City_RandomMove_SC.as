package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_City_RandomMove_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_RandomMove_SC";
      
      public static const NEWPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_City_RandomMove_SC.newPos","newPos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_RandomMove_SC.area","area",2 << 3 | WireType.VARINT);
      
      public static const BEATTACK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_City_RandomMove_SC.beAttack","beAttack",3 << 3 | WireType.VARINT);
       
      
      private var newPos$field:Dto_WorldMap_Pos;
      
      private var area$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beAttack$field:Boolean;
      
      public function Cmd_City_RandomMove_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_RandomMove_SC.$MessageID;
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
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967294;
         this.area$field = new uint();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set area(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.area$field = param1;
      }
      
      public function get area() : uint
      {
         return this.area$field;
      }
      
      public function clearBeAttack() : void
      {
         this.hasField$0 &= 4294967293;
         this.beAttack$field = new Boolean();
      }
      
      public function get hasBeAttack() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beAttack(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.beAttack$field = param1;
      }
      
      public function get beAttack() : Boolean
      {
         return this.beAttack$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNewPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.newPos$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
         }
         if(this.hasBeAttack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.beAttack$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_RandomMove_SC.newPos cannot be set twice.");
                  }
                  _loc3_++;
                  this.newPos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.newPos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_RandomMove_SC.area cannot be set twice.");
                  }
                  _loc4_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_RandomMove_SC.beAttack cannot be set twice.");
                  }
                  _loc5_++;
                  this.beAttack = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
