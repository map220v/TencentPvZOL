package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_RoleList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_RoleList_SC";
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_RoleList_SC.page","page",1 << 3 | WireType.VARINT);
      
      public static const SUMPAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_RoleList_SC.sumPage","sumPage",2 << 3 | WireType.VARINT);
      
      public static const PAGESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_RoleList_SC.pageSize","pageSize",3 << 3 | WireType.VARINT);
      
      public static const ROLEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_RoleList_SC.roleInfo","roleInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightRoleListInfo);
       
      
      private var page$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sumPage$field:uint;
      
      private var pageSize$field:uint;
      
      public var roleInfo:Array;
      
      public function Cmd_TopFight_RoleList_SC()
      {
         this.roleInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_RoleList_SC.$MessageID;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967294;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearSumPage() : void
      {
         this.hasField$0 &= 4294967293;
         this.sumPage$field = new uint();
      }
      
      public function get hasSumPage() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sumPage(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sumPage$field = param1;
      }
      
      public function get sumPage() : uint
      {
         return this.sumPage$field;
      }
      
      public function clearPageSize() : void
      {
         this.hasField$0 &= 4294967291;
         this.pageSize$field = new uint();
      }
      
      public function get hasPageSize() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set pageSize(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.pageSize$field = param1;
      }
      
      public function get pageSize() : uint
      {
         return this.pageSize$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasSumPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.sumPage$field);
         }
         if(this.hasPageSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.pageSize$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_TopFight_RoleList_SC.page cannot be set twice.");
                  }
                  _loc3_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_RoleList_SC.sumPage cannot be set twice.");
                  }
                  _loc4_++;
                  this.sumPage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_RoleList_SC.pageSize cannot be set twice.");
                  }
                  _loc5_++;
                  this.pageSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.roleInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightRoleListInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
