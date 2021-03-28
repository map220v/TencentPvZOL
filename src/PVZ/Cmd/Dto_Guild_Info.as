package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Guild_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guild_Info";
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Info.baseInfo","baseInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_BaseInfo);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.exp","exp",2 << 3 | WireType.VARINT);
      
      public static const HONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.honor","honor",3 << 3 | WireType.VARINT);
      
      public static const QQGROUP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_Info.qqGroup","qqGroup",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CURBID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.curBid","curBid",5 << 3 | WireType.VARINT);
      
      public static const LASTLEVELUPTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.lastLevelUpTime","lastLevelUpTime",6 << 3 | WireType.VARINT);
      
      public static const NOTICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_Info.notice","notice",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DEPUTYLEADER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Info.deputyLeader","deputyLeader",8 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const ELITE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Info.elite","elite",9 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const DISBANDFLAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.disbandFlag","disbandFlag",10 << 3 | WireType.VARINT);
      
      public static const DISBANDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.disbandTime","disbandTime",11 << 3 | WireType.VARINT);
      
      public static const DELIVERFLAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.deliverFlag","deliverFlag",12 << 3 | WireType.VARINT);
      
      public static const DELIVERTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.deliverTime","deliverTime",13 << 3 | WireType.VARINT);
      
      public static const DELATERFLAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.delaterFlag","delaterFlag",14 << 3 | WireType.VARINT);
      
      public static const DELATERTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.delaterTime","delaterTime",15 << 3 | WireType.VARINT);
      
      public static const DELATER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Info.delater","delater",16 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const DELIVER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Info.deliver","deliver",17 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const COHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Info.cohesion","cohesion",18 << 3 | WireType.VARINT);
       
      
      private var baseInfo$field:Dto_Guild_BaseInfo;
      
      private var exp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var honor$field:uint;
      
      private var qqGroup$field:String;
      
      private var curBid$field:uint;
      
      private var lastLevelUpTime$field:uint;
      
      private var notice$field:String;
      
      public var deputyLeader:Array;
      
      public var elite:Array;
      
      private var disbandFlag$field:uint;
      
      private var disbandTime$field:uint;
      
      private var deliverFlag$field:uint;
      
      private var deliverTime$field:uint;
      
      private var delaterFlag$field:uint;
      
      private var delaterTime$field:uint;
      
      private var delater$field:Dto_Guild_User;
      
      private var deliver$field:Dto_Guild_User;
      
      private var cohesion$field:uint;
      
      public function Dto_Guild_Info()
      {
         this.deputyLeader = [];
         this.elite = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guild_Info.$MessageID;
      }
      
      public function clearBaseInfo() : void
      {
         this.baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return this.baseInfo$field != null;
      }
      
      public function set baseInfo(param1:Dto_Guild_BaseInfo) : void
      {
         this.baseInfo$field = param1;
      }
      
      public function get baseInfo() : Dto_Guild_BaseInfo
      {
         return this.baseInfo$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearHonor() : void
      {
         this.hasField$0 &= 4294967293;
         this.honor$field = new uint();
      }
      
      public function get hasHonor() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set honor(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.honor$field = param1;
      }
      
      public function get honor() : uint
      {
         return this.honor$field;
      }
      
      public function clearQqGroup() : void
      {
         this.qqGroup$field = null;
      }
      
      public function get hasQqGroup() : Boolean
      {
         return this.qqGroup$field != null;
      }
      
      public function set qqGroup(param1:String) : void
      {
         this.qqGroup$field = param1;
      }
      
      public function get qqGroup() : String
      {
         return this.qqGroup$field;
      }
      
      public function clearCurBid() : void
      {
         this.hasField$0 &= 4294967291;
         this.curBid$field = new uint();
      }
      
      public function get hasCurBid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set curBid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.curBid$field = param1;
      }
      
      public function get curBid() : uint
      {
         return this.curBid$field;
      }
      
      public function clearLastLevelUpTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.lastLevelUpTime$field = new uint();
      }
      
      public function get hasLastLevelUpTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lastLevelUpTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lastLevelUpTime$field = param1;
      }
      
      public function get lastLevelUpTime() : uint
      {
         return this.lastLevelUpTime$field;
      }
      
      public function clearNotice() : void
      {
         this.notice$field = null;
      }
      
      public function get hasNotice() : Boolean
      {
         return this.notice$field != null;
      }
      
      public function set notice(param1:String) : void
      {
         this.notice$field = param1;
      }
      
      public function get notice() : String
      {
         return this.notice$field;
      }
      
      public function clearDisbandFlag() : void
      {
         this.hasField$0 &= 4294967279;
         this.disbandFlag$field = new uint();
      }
      
      public function get hasDisbandFlag() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set disbandFlag(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.disbandFlag$field = param1;
      }
      
      public function get disbandFlag() : uint
      {
         return this.disbandFlag$field;
      }
      
      public function clearDisbandTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.disbandTime$field = new uint();
      }
      
      public function get hasDisbandTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set disbandTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.disbandTime$field = param1;
      }
      
      public function get disbandTime() : uint
      {
         return this.disbandTime$field;
      }
      
      public function clearDeliverFlag() : void
      {
         this.hasField$0 &= 4294967231;
         this.deliverFlag$field = new uint();
      }
      
      public function get hasDeliverFlag() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set deliverFlag(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.deliverFlag$field = param1;
      }
      
      public function get deliverFlag() : uint
      {
         return this.deliverFlag$field;
      }
      
      public function clearDeliverTime() : void
      {
         this.hasField$0 &= 4294967167;
         this.deliverTime$field = new uint();
      }
      
      public function get hasDeliverTime() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set deliverTime(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.deliverTime$field = param1;
      }
      
      public function get deliverTime() : uint
      {
         return this.deliverTime$field;
      }
      
      public function clearDelaterFlag() : void
      {
         this.hasField$0 &= 4294967039;
         this.delaterFlag$field = new uint();
      }
      
      public function get hasDelaterFlag() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set delaterFlag(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.delaterFlag$field = param1;
      }
      
      public function get delaterFlag() : uint
      {
         return this.delaterFlag$field;
      }
      
      public function clearDelaterTime() : void
      {
         this.hasField$0 &= 4294966783;
         this.delaterTime$field = new uint();
      }
      
      public function get hasDelaterTime() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set delaterTime(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.delaterTime$field = param1;
      }
      
      public function get delaterTime() : uint
      {
         return this.delaterTime$field;
      }
      
      public function clearDelater() : void
      {
         this.delater$field = null;
      }
      
      public function get hasDelater() : Boolean
      {
         return this.delater$field != null;
      }
      
      public function set delater(param1:Dto_Guild_User) : void
      {
         this.delater$field = param1;
      }
      
      public function get delater() : Dto_Guild_User
      {
         return this.delater$field;
      }
      
      public function clearDeliver() : void
      {
         this.deliver$field = null;
      }
      
      public function get hasDeliver() : Boolean
      {
         return this.deliver$field != null;
      }
      
      public function set deliver(param1:Dto_Guild_User) : void
      {
         this.deliver$field = param1;
      }
      
      public function get deliver() : Dto_Guild_User
      {
         return this.deliver$field;
      }
      
      public function clearCohesion() : void
      {
         this.hasField$0 &= 4294966271;
         this.cohesion$field = new uint();
      }
      
      public function get hasCohesion() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set cohesion(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.cohesion$field = param1;
      }
      
      public function get cohesion() : uint
      {
         return this.cohesion$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasBaseInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasHonor)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.honor$field);
         }
         if(this.hasQqGroup)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.qqGroup$field);
         }
         if(this.hasCurBid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.curBid$field);
         }
         if(this.hasLastLevelUpTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lastLevelUpTime$field);
         }
         if(this.hasNotice)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.notice$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.deputyLeader.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.deputyLeader[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.elite.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.elite[_loc3_]);
            _loc3_++;
         }
         if(this.hasDisbandFlag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.disbandFlag$field);
         }
         if(this.hasDisbandTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.disbandTime$field);
         }
         if(this.hasDeliverFlag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.deliverFlag$field);
         }
         if(this.hasDeliverTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.deliverTime$field);
         }
         if(this.hasDelaterFlag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.delaterFlag$field);
         }
         if(this.hasDelaterTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.delaterTime$field);
         }
         if(this.hasDelater)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.delater$field);
         }
         if(this.hasDeliver)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,17);
            WriteUtils.write$TYPE_MESSAGE(param1,this.deliver$field);
         }
         if(this.hasCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.cohesion$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc19_:uint = 0;
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
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc19_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc19_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new Dto_Guild_BaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.honor cannot be set twice.");
                  }
                  _loc5_++;
                  this.honor = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.qqGroup cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqGroup = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.curBid cannot be set twice.");
                  }
                  _loc7_++;
                  this.curBid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.lastLevelUpTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastLevelUpTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.notice cannot be set twice.");
                  }
                  _loc9_++;
                  this.notice = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 8:
                  this.deputyLeader.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guild_User()));
                  break;
               case 9:
                  this.elite.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guild_User()));
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.disbandFlag cannot be set twice.");
                  }
                  _loc10_++;
                  this.disbandFlag = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.disbandTime cannot be set twice.");
                  }
                  _loc11_++;
                  this.disbandTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.deliverFlag cannot be set twice.");
                  }
                  _loc12_++;
                  this.deliverFlag = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.deliverTime cannot be set twice.");
                  }
                  _loc13_++;
                  this.deliverTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.delaterFlag cannot be set twice.");
                  }
                  _loc14_++;
                  this.delaterFlag = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.delaterTime cannot be set twice.");
                  }
                  _loc15_++;
                  this.delaterTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.delater cannot be set twice.");
                  }
                  _loc16_++;
                  this.delater = new Dto_Guild_User();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.delater);
                  break;
               case 17:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.deliver cannot be set twice.");
                  }
                  _loc17_++;
                  this.deliver = new Dto_Guild_User();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.deliver);
                  break;
               case 18:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Info.cohesion cannot be set twice.");
                  }
                  _loc18_++;
                  this.cohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc19_);
                  break;
            }
         }
      }
   }
}
