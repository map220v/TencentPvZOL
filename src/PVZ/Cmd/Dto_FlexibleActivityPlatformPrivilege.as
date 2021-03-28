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
   
   public final class Dto_FlexibleActivityPlatformPrivilege extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilege";
      
      public static const RELATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilege.relation","relation",1 << 3 | WireType.VARINT);
      
      public static const ISNOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilege.isNot","isNot",2 << 3 | WireType.VARINT);
      
      public static const CONDITION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilege.condition","condition",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityPlatformPrivilegeInfo);
       
      
      private var relation$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isNot$field:Boolean;
      
      private var condition$field:Dto_FlexibleActivityPlatformPrivilegeInfo;
      
      public function Dto_FlexibleActivityPlatformPrivilege()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityPlatformPrivilege.$MessageID;
      }
      
      public function clearRelation() : void
      {
         this.hasField$0 &= 4294967294;
         this.relation$field = new uint();
      }
      
      public function get hasRelation() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set relation(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.relation$field = param1;
      }
      
      public function get relation() : uint
      {
         return this.relation$field;
      }
      
      public function clearIsNot() : void
      {
         this.hasField$0 &= 4294967293;
         this.isNot$field = new Boolean();
      }
      
      public function get hasIsNot() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isNot(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isNot$field = param1;
      }
      
      public function get isNot() : Boolean
      {
         return this.isNot$field;
      }
      
      public function clearCondition() : void
      {
         this.condition$field = null;
      }
      
      public function get hasCondition() : Boolean
      {
         return this.condition$field != null;
      }
      
      public function set condition(param1:Dto_FlexibleActivityPlatformPrivilegeInfo) : void
      {
         this.condition$field = param1;
      }
      
      public function get condition() : Dto_FlexibleActivityPlatformPrivilegeInfo
      {
         return this.condition$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRelation)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.relation$field);
         }
         if(this.hasIsNot)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isNot$field);
         }
         if(this.hasCondition)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.condition$field);
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
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilege.relation cannot be set twice.");
                  }
                  _loc3_++;
                  this.relation = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilege.isNot cannot be set twice.");
                  }
                  _loc4_++;
                  this.isNot = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilege.condition cannot be set twice.");
                  }
                  _loc5_++;
                  this.condition = new Dto_FlexibleActivityPlatformPrivilegeInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.condition);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
