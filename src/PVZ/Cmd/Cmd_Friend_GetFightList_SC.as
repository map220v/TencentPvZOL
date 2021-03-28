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
   
   public final class Cmd_Friend_GetFightList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_GetFightList_SC";
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetFightList_SC.page","page",1 << 3 | WireType.VARINT);
      
      public static const PAGESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetFightList_SC.pageSize","pageSize",2 << 3 | WireType.VARINT);
      
      public static const TOTALCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetFightList_SC.totalCount","totalCount",3 << 3 | WireType.VARINT);
      
      public static const FIGHTINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Friend_GetFightList_SC.fightInfos","fightInfos",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendFightInfo);
       
      
      private var page$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pageSize$field:uint;
      
      private var totalCount$field:uint;
      
      public var fightInfos:Array;
      
      public function Cmd_Friend_GetFightList_SC()
      {
         this.fightInfos = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_GetFightList_SC.$MessageID;
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
      
      public function clearPageSize() : void
      {
         this.hasField$0 &= 4294967293;
         this.pageSize$field = new uint();
      }
      
      public function get hasPageSize() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set pageSize(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.pageSize$field = param1;
      }
      
      public function get pageSize() : uint
      {
         return this.pageSize$field;
      }
      
      public function clearTotalCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalCount$field = new uint();
      }
      
      public function get hasTotalCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalCount$field = param1;
      }
      
      public function get totalCount() : uint
      {
         return this.totalCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasPageSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.pageSize$field);
         }
         if(this.hasTotalCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.fightInfos.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fightInfos[_loc2_]);
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
                     throw new IOError("Bad data format: Cmd_Friend_GetFightList_SC.page cannot be set twice.");
                  }
                  _loc3_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetFightList_SC.pageSize cannot be set twice.");
                  }
                  _loc4_++;
                  this.pageSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetFightList_SC.totalCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.fightInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FriendFightInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
