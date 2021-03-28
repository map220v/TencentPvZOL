package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_14 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_14";
      
      public static const TOTALCOMPLETIONCHESTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.totalCompletionChestId","totalCompletionChestId",1 << 3 | WireType.VARINT);
      
      public static const RESETNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.resetNum","resetNum",3 << 3 | WireType.VARINT);
      
      public static const RESETCOST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_14.resetCost","resetCost",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const INIDICENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.iniDiceNum","iniDiceNum",5 << 3 | WireType.VARINT);
      
      public static const MAPSTAT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_14.mapStat","mapStat",10 << 3 | WireType.LENGTH_DELIMITED,Dto_CastleAdventure_Map);
      
      public static const CURMAP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.curMap","curMap",11 << 3 | WireType.VARINT);
      
      public static const CURLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.curLevel","curLevel",12 << 3 | WireType.VARINT);
      
      public static const TOTALCOMPLETION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.totalCompletion","totalCompletion",13 << 3 | WireType.VARINT);
      
      public static const TAKECOMPLETIONREWARDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.takeCompletionRewardTime","takeCompletionRewardTime",14 << 3 | WireType.VARINT);
      
      public static const USEDDICENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.usedDiceNum","usedDiceNum",18 << 3 | WireType.VARINT);
      
      public static const DAYLYRESTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.daylyRestNum","daylyRestNum",19 << 3 | WireType.VARINT);
      
      public static const RESETREFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_14.resetRefreshTime","resetRefreshTime",20 << 3 | WireType.VARINT);
       
      
      private var totalCompletionChestId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var resetNum$field:uint;
      
      private var resetCost$field:Dto_IdNum;
      
      private var iniDiceNum$field:uint;
      
      public var mapStat:Array;
      
      private var curMap$field:uint;
      
      private var curLevel$field:uint;
      
      private var totalCompletion$field:uint;
      
      private var takeCompletionRewardTime$field:uint;
      
      private var usedDiceNum$field:uint;
      
      private var daylyRestNum$field:uint;
      
      private var resetRefreshTime$field:uint;
      
      public function FlexibleActivity_14()
      {
         this.mapStat = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_14.$MessageID;
      }
      
      public function clearTotalCompletionChestId() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalCompletionChestId$field = new uint();
      }
      
      public function get hasTotalCompletionChestId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalCompletionChestId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalCompletionChestId$field = param1;
      }
      
      public function get totalCompletionChestId() : uint
      {
         return this.totalCompletionChestId$field;
      }
      
      public function clearResetNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.resetNum$field = new uint();
      }
      
      public function get hasResetNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set resetNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.resetNum$field = param1;
      }
      
      public function get resetNum() : uint
      {
         return this.resetNum$field;
      }
      
      public function clearResetCost() : void
      {
         this.resetCost$field = null;
      }
      
      public function get hasResetCost() : Boolean
      {
         return this.resetCost$field != null;
      }
      
      public function set resetCost(param1:Dto_IdNum) : void
      {
         this.resetCost$field = param1;
      }
      
      public function get resetCost() : Dto_IdNum
      {
         return this.resetCost$field;
      }
      
      public function clearIniDiceNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.iniDiceNum$field = new uint();
      }
      
      public function get hasIniDiceNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set iniDiceNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.iniDiceNum$field = param1;
      }
      
      public function get iniDiceNum() : uint
      {
         return this.iniDiceNum$field;
      }
      
      public function clearCurMap() : void
      {
         this.hasField$0 &= 4294967287;
         this.curMap$field = new uint();
      }
      
      public function get hasCurMap() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set curMap(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.curMap$field = param1;
      }
      
      public function get curMap() : uint
      {
         return this.curMap$field;
      }
      
      public function clearCurLevel() : void
      {
         this.hasField$0 &= 4294967279;
         this.curLevel$field = new uint();
      }
      
      public function get hasCurLevel() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set curLevel(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.curLevel$field = param1;
      }
      
      public function get curLevel() : uint
      {
         return this.curLevel$field;
      }
      
      public function clearTotalCompletion() : void
      {
         this.hasField$0 &= 4294967263;
         this.totalCompletion$field = new uint();
      }
      
      public function get hasTotalCompletion() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set totalCompletion(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.totalCompletion$field = param1;
      }
      
      public function get totalCompletion() : uint
      {
         return this.totalCompletion$field;
      }
      
      public function clearTakeCompletionRewardTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.takeCompletionRewardTime$field = new uint();
      }
      
      public function get hasTakeCompletionRewardTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set takeCompletionRewardTime(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.takeCompletionRewardTime$field = param1;
      }
      
      public function get takeCompletionRewardTime() : uint
      {
         return this.takeCompletionRewardTime$field;
      }
      
      public function clearUsedDiceNum() : void
      {
         this.hasField$0 &= 4294967167;
         this.usedDiceNum$field = new uint();
      }
      
      public function get hasUsedDiceNum() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set usedDiceNum(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.usedDiceNum$field = param1;
      }
      
      public function get usedDiceNum() : uint
      {
         return this.usedDiceNum$field;
      }
      
      public function clearDaylyRestNum() : void
      {
         this.hasField$0 &= 4294967039;
         this.daylyRestNum$field = new uint();
      }
      
      public function get hasDaylyRestNum() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set daylyRestNum(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.daylyRestNum$field = param1;
      }
      
      public function get daylyRestNum() : uint
      {
         return this.daylyRestNum$field;
      }
      
      public function clearResetRefreshTime() : void
      {
         this.hasField$0 &= 4294966783;
         this.resetRefreshTime$field = new uint();
      }
      
      public function get hasResetRefreshTime() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set resetRefreshTime(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.resetRefreshTime$field = param1;
      }
      
      public function get resetRefreshTime() : uint
      {
         return this.resetRefreshTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasTotalCompletionChestId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCompletionChestId$field);
         }
         if(this.hasResetNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.resetNum$field);
         }
         if(this.hasResetCost)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.resetCost$field);
         }
         if(this.hasIniDiceNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.iniDiceNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.mapStat.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mapStat[_loc2_]);
            _loc2_++;
         }
         if(this.hasCurMap)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.curMap$field);
         }
         if(this.hasCurLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.curLevel$field);
         }
         if(this.hasTotalCompletion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCompletion$field);
         }
         if(this.hasTakeCompletionRewardTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.takeCompletionRewardTime$field);
         }
         if(this.hasUsedDiceNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.usedDiceNum$field);
         }
         if(this.hasDaylyRestNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,19);
            WriteUtils.write$TYPE_UINT32(param1,this.daylyRestNum$field);
         }
         if(this.hasResetRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.resetRefreshTime$field);
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
                     throw new IOError("Bad data format: FlexibleActivity_14.totalCompletionChestId cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalCompletionChestId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.resetNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.resetNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.resetCost cannot be set twice.");
                  }
                  _loc5_++;
                  this.resetCost = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.resetCost);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.iniDiceNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.iniDiceNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.mapStat.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CastleAdventure_Map()));
                  break;
               case 11:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.curMap cannot be set twice.");
                  }
                  _loc7_++;
                  this.curMap = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.curLevel cannot be set twice.");
                  }
                  _loc8_++;
                  this.curLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.totalCompletion cannot be set twice.");
                  }
                  _loc9_++;
                  this.totalCompletion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.takeCompletionRewardTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.takeCompletionRewardTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.usedDiceNum cannot be set twice.");
                  }
                  _loc11_++;
                  this.usedDiceNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 19:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.daylyRestNum cannot be set twice.");
                  }
                  _loc12_++;
                  this.daylyRestNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_14.resetRefreshTime cannot be set twice.");
                  }
                  _loc13_++;
                  this.resetRefreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
