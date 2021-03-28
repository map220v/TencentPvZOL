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
   
   public final class Cmd_City_Init_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_Init_SC";
      
      public static const ROLEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_City_Init_SC.rolePos","rolePos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_Init_SC.area","area",2 << 3 | WireType.VARINT);
      
      public static const CHANGECDENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_Init_SC.changeCDEndTime","changeCDEndTime",3 << 3 | WireType.VARINT);
      
      public static const SHOWNULLCITY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_City_Init_SC.showNullCity","showNullCity",4 << 3 | WireType.VARINT);
       
      
      private var rolePos$field:Dto_WorldMap_Pos;
      
      private var area$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var changeCDEndTime$field:uint;
      
      private var showNullCity$field:Boolean;
      
      public function Cmd_City_Init_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_Init_SC.$MessageID;
      }
      
      public function clearRolePos() : void
      {
         this.rolePos$field = null;
      }
      
      public function get hasRolePos() : Boolean
      {
         return this.rolePos$field != null;
      }
      
      public function set rolePos(param1:Dto_WorldMap_Pos) : void
      {
         this.rolePos$field = param1;
      }
      
      public function get rolePos() : Dto_WorldMap_Pos
      {
         return this.rolePos$field;
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
      
      public function clearChangeCDEndTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.changeCDEndTime$field = new uint();
      }
      
      public function get hasChangeCDEndTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set changeCDEndTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.changeCDEndTime$field = param1;
      }
      
      public function get changeCDEndTime() : uint
      {
         return this.changeCDEndTime$field;
      }
      
      public function clearShowNullCity() : void
      {
         this.hasField$0 &= 4294967291;
         this.showNullCity$field = new Boolean();
      }
      
      public function get hasShowNullCity() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set showNullCity(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.showNullCity$field = param1;
      }
      
      public function get showNullCity() : Boolean
      {
         return this.showNullCity$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRolePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rolePos$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
         }
         if(this.hasChangeCDEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.changeCDEndTime$field);
         }
         if(this.hasShowNullCity)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.showNullCity$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_Init_SC.rolePos cannot be set twice.");
                  }
                  _loc3_++;
                  this.rolePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rolePos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_Init_SC.area cannot be set twice.");
                  }
                  _loc4_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_Init_SC.changeCDEndTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.changeCDEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_Init_SC.showNullCity cannot be set twice.");
                  }
                  _loc6_++;
                  this.showNullCity = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
