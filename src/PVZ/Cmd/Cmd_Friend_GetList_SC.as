package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Friend_GetList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_GetList_SC";
      
      public static const MODULETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.moduleType","moduleType",1 << 3 | WireType.VARINT);
      
      public static const FRIENDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.friendType","friendType",2 << 3 | WireType.VARINT);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.page","page",3 << 3 | WireType.VARINT);
      
      public static const PAGESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.pageSize","pageSize",4 << 3 | WireType.VARINT);
      
      public static const TOTALCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.totalCount","totalCount",5 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Friend_GetList_SC.name","name",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Friend_GetList_SC.friends","friends",7 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendInfo);
      
      public static const FIGHTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.fightNum","fightNum",8 << 3 | WireType.VARINT);
      
      public static const PRESENTENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.presentEnergyNum","presentEnergyNum",9 << 3 | WireType.VARINT);
      
      public static const STEALFARMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.stealFarmNum","stealFarmNum",10 << 3 | WireType.VARINT);
      
      public static const CANRECOMMEND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Friend_GetList_SC.canRecommend","canRecommend",11 << 3 | WireType.VARINT);
      
      public static const TAKEENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_SC.takeEnergyNum","takeEnergyNum",12 << 3 | WireType.VARINT);
       
      
      private var moduleType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendType$field:uint;
      
      private var page$field:uint;
      
      private var pageSize$field:uint;
      
      private var totalCount$field:uint;
      
      private var name$field:String;
      
      public var friends:Array;
      
      private var fightNum$field:uint;
      
      private var presentEnergyNum$field:uint;
      
      private var stealFarmNum$field:uint;
      
      private var canRecommend$field:Boolean;
      
      private var takeEnergyNum$field:uint;
      
      public function Cmd_Friend_GetList_SC()
      {
         this.friends = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_GetList_SC.$MessageID;
      }
      
      public function clearModuleType() : void
      {
         this.hasField$0 &= 4294967294;
         this.moduleType$field = new uint();
      }
      
      public function get hasModuleType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set moduleType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.moduleType$field = param1;
      }
      
      public function get moduleType() : uint
      {
         return this.moduleType$field;
      }
      
      public function clearFriendType() : void
      {
         this.hasField$0 &= 4294967293;
         this.friendType$field = new uint();
      }
      
      public function get hasFriendType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set friendType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.friendType$field = param1;
      }
      
      public function get friendType() : uint
      {
         return this.friendType$field;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967291;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearPageSize() : void
      {
         this.hasField$0 &= 4294967287;
         this.pageSize$field = new uint();
      }
      
      public function get hasPageSize() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set pageSize(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.pageSize$field = param1;
      }
      
      public function get pageSize() : uint
      {
         return this.pageSize$field;
      }
      
      public function clearTotalCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.totalCount$field = new uint();
      }
      
      public function get hasTotalCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set totalCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.totalCount$field = param1;
      }
      
      public function get totalCount() : uint
      {
         return this.totalCount$field;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearFightNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.fightNum$field = new uint();
      }
      
      public function get hasFightNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set fightNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.fightNum$field = param1;
      }
      
      public function get fightNum() : uint
      {
         return this.fightNum$field;
      }
      
      public function clearPresentEnergyNum() : void
      {
         this.hasField$0 &= 4294967231;
         this.presentEnergyNum$field = new uint();
      }
      
      public function get hasPresentEnergyNum() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set presentEnergyNum(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.presentEnergyNum$field = param1;
      }
      
      public function get presentEnergyNum() : uint
      {
         return this.presentEnergyNum$field;
      }
      
      public function clearStealFarmNum() : void
      {
         this.hasField$0 &= 4294967167;
         this.stealFarmNum$field = new uint();
      }
      
      public function get hasStealFarmNum() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set stealFarmNum(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.stealFarmNum$field = param1;
      }
      
      public function get stealFarmNum() : uint
      {
         return this.stealFarmNum$field;
      }
      
      public function clearCanRecommend() : void
      {
         this.hasField$0 &= 4294967039;
         this.canRecommend$field = new Boolean();
      }
      
      public function get hasCanRecommend() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set canRecommend(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.canRecommend$field = param1;
      }
      
      public function get canRecommend() : Boolean
      {
         return this.canRecommend$field;
      }
      
      public function clearTakeEnergyNum() : void
      {
         this.hasField$0 &= 4294966783;
         this.takeEnergyNum$field = new uint();
      }
      
      public function get hasTakeEnergyNum() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set takeEnergyNum(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.takeEnergyNum$field = param1;
      }
      
      public function get takeEnergyNum() : uint
      {
         return this.takeEnergyNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasModuleType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.moduleType$field);
         }
         if(this.hasFriendType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.friendType$field);
         }
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasPageSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.pageSize$field);
         }
         if(this.hasTotalCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCount$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.friends.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friends[_loc2_]);
            _loc2_++;
         }
         if(this.hasFightNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.fightNum$field);
         }
         if(this.hasPresentEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.presentEnergyNum$field);
         }
         if(this.hasStealFarmNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.stealFarmNum$field);
         }
         if(this.hasCanRecommend)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_BOOL(param1,this.canRecommend$field);
         }
         if(this.hasTakeEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.takeEnergyNum$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.moduleType cannot be set twice.");
                  }
                  _loc3_++;
                  this.moduleType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.friendType cannot be set twice.");
                  }
                  _loc4_++;
                  this.friendType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.page cannot be set twice.");
                  }
                  _loc5_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.pageSize cannot be set twice.");
                  }
                  _loc6_++;
                  this.pageSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.totalCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.name cannot be set twice.");
                  }
                  _loc8_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  this.friends.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FriendInfo()));
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.fightNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.fightNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.presentEnergyNum cannot be set twice.");
                  }
                  _loc10_++;
                  this.presentEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.stealFarmNum cannot be set twice.");
                  }
                  _loc11_++;
                  this.stealFarmNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.canRecommend cannot be set twice.");
                  }
                  _loc12_++;
                  this.canRecommend = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_SC.takeEnergyNum cannot be set twice.");
                  }
                  _loc13_++;
                  this.takeEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
