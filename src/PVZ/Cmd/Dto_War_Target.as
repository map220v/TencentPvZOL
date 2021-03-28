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
   
   public final class Dto_War_Target extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_War_Target";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_Target.type","type",1 << 3 | WireType.VARINT);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_Target.id","id",2 << 3 | WireType.VARINT);
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_War_Target.pos","pos",3 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const ROLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_War_Target.roleInfo","roleInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_War_RoleInfo);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var pos$field:Dto_WorldMap_Pos;
      
      private var roleInfo$field:Dto_War_RoleInfo;
      
      public function Dto_War_Target()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_War_Target.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967293;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearPos() : void
      {
         this.pos$field = null;
      }
      
      public function get hasPos() : Boolean
      {
         return this.pos$field != null;
      }
      
      public function set pos(param1:Dto_WorldMap_Pos) : void
      {
         this.pos$field = param1;
      }
      
      public function get pos() : Dto_WorldMap_Pos
      {
         return this.pos$field;
      }
      
      public function clearRoleInfo() : void
      {
         this.roleInfo$field = null;
      }
      
      public function get hasRoleInfo() : Boolean
      {
         return this.roleInfo$field != null;
      }
      
      public function set roleInfo(param1:Dto_War_RoleInfo) : void
      {
         this.roleInfo$field = param1;
      }
      
      public function get roleInfo() : Dto_War_RoleInfo
      {
         return this.roleInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
         }
         if(this.hasRoleInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo$field);
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
                     throw new IOError("Bad data format: Dto_War_Target.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_Target.id cannot be set twice.");
                  }
                  _loc4_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_Target.pos cannot be set twice.");
                  }
                  _loc5_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_Target.roleInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleInfo = new Dto_War_RoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
