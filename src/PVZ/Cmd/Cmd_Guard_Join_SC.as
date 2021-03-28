package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guard_Join_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_Join_SC";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Guard_Join_SC.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const GUARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_Join_SC.guard","guard",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Guard);
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_Join_SC.formation","formation",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
       
      
      private var roleId$field:Int64;
      
      private var guard$field:Dto_Guard;
      
      private var formation$field:Dto_FormationInfo;
      
      public function Cmd_Guard_Join_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_Join_SC.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearGuard() : void
      {
         this.guard$field = null;
      }
      
      public function get hasGuard() : Boolean
      {
         return this.guard$field != null;
      }
      
      public function set guard(param1:Dto_Guard) : void
      {
         this.guard$field = param1;
      }
      
      public function get guard() : Dto_Guard
      {
         return this.guard$field;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_FormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_FormationInfo
      {
         return this.formation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasGuard)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guard$field);
         }
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
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
                     throw new IOError("Bad data format: Cmd_Guard_Join_SC.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Join_SC.guard cannot be set twice.");
                  }
                  _loc4_++;
                  this.guard = new Dto_Guard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guard);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Join_SC.formation cannot be set twice.");
                  }
                  _loc5_++;
                  this.formation = new Dto_FormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
