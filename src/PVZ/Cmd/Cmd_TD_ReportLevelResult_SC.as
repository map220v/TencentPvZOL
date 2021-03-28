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
   
   public final class Cmd_TD_ReportLevelResult_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_ReportLevelResult_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.levelId","levelId",2 << 3 | WireType.VARINT);
      
      public static const SUBLEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.subLevelId","subLevelId",3 << 3 | WireType.VARINT);
      
      public static const EXPREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.expReward","expReward",5 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.star","star",6 << 3 | WireType.VARINT);
      
      public static const FIRSTPASSCOINREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.firstPassCoinReward","firstPassCoinReward",7 << 3 | WireType.VARINT);
      
      public static const ITEMREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.itemReward","itemReward",8 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CHALLENGELEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.challengeLevelId","challengeLevelId",9 << 3 | WireType.VARINT);
      
      public static const FROMSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.fromScore","fromScore",10 << 3 | WireType.VARINT);
      
      public static const TOSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.toScore","toScore",11 << 3 | WireType.VARINT);
      
      public static const PROMOTIONREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_SC.promotionReward","promotionReward",12 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var levelId$field:uint;
      
      private var subLevelId$field:uint;
      
      private var expReward$field:uint;
      
      private var star$field:uint;
      
      private var firstPassCoinReward$field:uint;
      
      public var itemReward:Array;
      
      private var challengeLevelId$field:uint;
      
      private var fromScore$field:uint;
      
      private var toScore$field:uint;
      
      private var promotionReward$field:uint;
      
      public function Cmd_TD_ReportLevelResult_SC()
      {
         this.itemReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_ReportLevelResult_SC.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967293;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearSubLevelId() : void
      {
         this.hasField$0 &= 4294967291;
         this.subLevelId$field = new uint();
      }
      
      public function get hasSubLevelId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set subLevelId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.subLevelId$field = param1;
      }
      
      public function get subLevelId() : uint
      {
         return this.subLevelId$field;
      }
      
      public function clearExpReward() : void
      {
         this.hasField$0 &= 4294967287;
         this.expReward$field = new uint();
      }
      
      public function get hasExpReward() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set expReward(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.expReward$field = param1;
      }
      
      public function get expReward() : uint
      {
         return this.expReward$field;
      }
      
      public function clearStar() : void
      {
         this.hasField$0 &= 4294967279;
         this.star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.star$field = param1;
      }
      
      public function get star() : uint
      {
         return this.star$field;
      }
      
      public function clearFirstPassCoinReward() : void
      {
         this.hasField$0 &= 4294967263;
         this.firstPassCoinReward$field = new uint();
      }
      
      public function get hasFirstPassCoinReward() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set firstPassCoinReward(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.firstPassCoinReward$field = param1;
      }
      
      public function get firstPassCoinReward() : uint
      {
         return this.firstPassCoinReward$field;
      }
      
      public function clearChallengeLevelId() : void
      {
         this.hasField$0 &= 4294967231;
         this.challengeLevelId$field = new uint();
      }
      
      public function get hasChallengeLevelId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set challengeLevelId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.challengeLevelId$field = param1;
      }
      
      public function get challengeLevelId() : uint
      {
         return this.challengeLevelId$field;
      }
      
      public function clearFromScore() : void
      {
         this.hasField$0 &= 4294967167;
         this.fromScore$field = new uint();
      }
      
      public function get hasFromScore() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set fromScore(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.fromScore$field = param1;
      }
      
      public function get fromScore() : uint
      {
         return this.fromScore$field;
      }
      
      public function clearToScore() : void
      {
         this.hasField$0 &= 4294967039;
         this.toScore$field = new uint();
      }
      
      public function get hasToScore() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set toScore(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.toScore$field = param1;
      }
      
      public function get toScore() : uint
      {
         return this.toScore$field;
      }
      
      public function clearPromotionReward() : void
      {
         this.hasField$0 &= 4294966783;
         this.promotionReward$field = new uint();
      }
      
      public function get hasPromotionReward() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set promotionReward(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.promotionReward$field = param1;
      }
      
      public function get promotionReward() : uint
      {
         return this.promotionReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasSubLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.subLevelId$field);
         }
         if(this.hasExpReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.expReward$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasFirstPassCoinReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.firstPassCoinReward$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.itemReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.itemReward[_loc2_]);
            _loc2_++;
         }
         if(this.hasChallengeLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeLevelId$field);
         }
         if(this.hasFromScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.fromScore$field);
         }
         if(this.hasToScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.toScore$field);
         }
         if(this.hasPromotionReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.promotionReward$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.levelId cannot be set twice.");
                  }
                  _loc4_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.subLevelId cannot be set twice.");
                  }
                  _loc5_++;
                  this.subLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.expReward cannot be set twice.");
                  }
                  _loc6_++;
                  this.expReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.star cannot be set twice.");
                  }
                  _loc7_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.firstPassCoinReward cannot be set twice.");
                  }
                  _loc8_++;
                  this.firstPassCoinReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  this.itemReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.challengeLevelId cannot be set twice.");
                  }
                  _loc9_++;
                  this.challengeLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.fromScore cannot be set twice.");
                  }
                  _loc10_++;
                  this.fromScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.toScore cannot be set twice.");
                  }
                  _loc11_++;
                  this.toScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_SC.promotionReward cannot be set twice.");
                  }
                  _loc12_++;
                  this.promotionReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
