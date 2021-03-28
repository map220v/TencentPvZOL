package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mine_StateChange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_StateChange_SC";
      
      public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Mine_StateChange_SC.type","type",1 << 3 | WireType.VARINT);
      
      public static const ROLEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_StateChange_SC.rolePos","rolePos",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mine_StateChange_SC.roleName","roleName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MINEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_StateChange_SC.minePos","minePos",4 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
       
      
      private var type$field:int;
      
      private var hasField$0:uint = 0;
      
      private var rolePos$field:Dto_WorldMap_Pos;
      
      private var roleName$field:String;
      
      private var minePos$field:Dto_WorldMap_Pos;
      
      public function Cmd_Mine_StateChange_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_StateChange_SC.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new int();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : int
      {
         return this.type$field;
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
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearMinePos() : void
      {
         this.minePos$field = null;
      }
      
      public function get hasMinePos() : Boolean
      {
         return this.minePos$field != null;
      }
      
      public function set minePos(param1:Dto_WorldMap_Pos) : void
      {
         this.minePos$field = param1;
      }
      
      public function get minePos() : Dto_WorldMap_Pos
      {
         return this.minePos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.type$field);
         }
         if(this.hasRolePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rolePos$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasMinePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.minePos$field);
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
                     throw new IOError("Bad data format: Cmd_Mine_StateChange_SC.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_StateChange_SC.rolePos cannot be set twice.");
                  }
                  _loc4_++;
                  this.rolePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rolePos);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_StateChange_SC.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_StateChange_SC.minePos cannot be set twice.");
                  }
                  _loc6_++;
                  this.minePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.minePos);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
