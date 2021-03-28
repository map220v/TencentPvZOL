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
   
   public final class Cmd_ExchangeStore_ItemList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC";
      
      public static const ENTRYLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.entrylist","entrylist",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ExchangeStore_Entry);
      
      public static const REFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.refreshTime","refreshTime",2 << 3 | WireType.VARINT);
      
      public static const REFRESHMAXTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.refreshMaxTimes","refreshMaxTimes",3 << 3 | WireType.VARINT);
      
      public static const REFRESHITEM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.refreshItem","refreshItem",4 << 3 | WireType.VARINT);
      
      public static const REFRESHTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.refreshTimes","refreshTimes",5 << 3 | WireType.VARINT);
      
      public static const REFRESHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExchangeStore_ItemList_SC.refreshNum","refreshNum",6 << 3 | WireType.VARINT);
       
      
      public var entrylist:Array;
      
      private var refreshTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var refreshMaxTimes$field:uint;
      
      private var refreshItem$field:uint;
      
      private var refreshTimes$field:uint;
      
      private var refreshNum$field:uint;
      
      public function Cmd_ExchangeStore_ItemList_SC()
      {
         this.entrylist = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExchangeStore_ItemList_SC.$MessageID;
      }
      
      public function clearRefreshTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.refreshTime$field = new uint();
      }
      
      public function get hasRefreshTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set refreshTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.refreshTime$field = param1;
      }
      
      public function get refreshTime() : uint
      {
         return this.refreshTime$field;
      }
      
      public function clearRefreshMaxTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.refreshMaxTimes$field = new uint();
      }
      
      public function get hasRefreshMaxTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set refreshMaxTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.refreshMaxTimes$field = param1;
      }
      
      public function get refreshMaxTimes() : uint
      {
         return this.refreshMaxTimes$field;
      }
      
      public function clearRefreshItem() : void
      {
         this.hasField$0 &= 4294967291;
         this.refreshItem$field = new uint();
      }
      
      public function get hasRefreshItem() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set refreshItem(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.refreshItem$field = param1;
      }
      
      public function get refreshItem() : uint
      {
         return this.refreshItem$field;
      }
      
      public function clearRefreshTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.refreshTimes$field = new uint();
      }
      
      public function get hasRefreshTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set refreshTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.refreshTimes$field = param1;
      }
      
      public function get refreshTimes() : uint
      {
         return this.refreshTimes$field;
      }
      
      public function clearRefreshNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.refreshNum$field = new uint();
      }
      
      public function get hasRefreshNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set refreshNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.refreshNum$field = param1;
      }
      
      public function get refreshNum() : uint
      {
         return this.refreshNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.entrylist.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.entrylist[_loc2_]);
            _loc2_++;
         }
         if(this.hasRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshTime$field);
         }
         if(this.hasRefreshMaxTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshMaxTimes$field);
         }
         if(this.hasRefreshItem)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshItem$field);
         }
         if(this.hasRefreshTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshTimes$field);
         }
         if(this.hasRefreshNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshNum$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  this.entrylist.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExchangeStore_Entry()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExchangeStore_ItemList_SC.refreshTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.refreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExchangeStore_ItemList_SC.refreshMaxTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.refreshMaxTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExchangeStore_ItemList_SC.refreshItem cannot be set twice.");
                  }
                  _loc5_++;
                  this.refreshItem = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExchangeStore_ItemList_SC.refreshTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.refreshTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExchangeStore_ItemList_SC.refreshNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.refreshNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
