package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_EnergyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_EnergyInfo_SC";
      
      public static const POOLID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.poolId","poolId",1 << 3 | WireType.VARINT);
      
      public static const CURENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.curEnergy","curEnergy",2 << 3 | WireType.VARINT);
      
      public static const BEADNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.beadNum","beadNum",3 << 3 | WireType.VARINT);
      
      public static const ATTACHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.attachId","attachId",4 << 3 | WireType.VARINT);
      
      public static const ISAUTOUSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.isAutoUse","isAutoUse",5 << 3 | WireType.VARINT);
      
      public static const CUREXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.curExp","curExp",6 << 3 | WireType.VARINT);
      
      public static const BUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_EnergyInfo_SC.buyTime","buyTime",7 << 3 | WireType.VARINT);
       
      
      private var poolId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var curEnergy$field:uint;
      
      private var beadNum$field:uint;
      
      private var attachId$field:uint;
      
      private var isAutoUse$field:Boolean;
      
      private var curExp$field:uint;
      
      private var buyTime$field:uint;
      
      public function Cmd_Equip_EnergyInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_EnergyInfo_SC.$MessageID;
      }
      
      public function clearPoolId() : void
      {
         this.hasField$0 &= 4294967294;
         this.poolId$field = new uint();
      }
      
      public function get hasPoolId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set poolId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.poolId$field = param1;
      }
      
      public function get poolId() : uint
      {
         return this.poolId$field;
      }
      
      public function clearCurEnergy() : void
      {
         this.hasField$0 &= 4294967293;
         this.curEnergy$field = new uint();
      }
      
      public function get hasCurEnergy() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set curEnergy(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.curEnergy$field = param1;
      }
      
      public function get curEnergy() : uint
      {
         return this.curEnergy$field;
      }
      
      public function clearBeadNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.beadNum$field = new uint();
      }
      
      public function get hasBeadNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set beadNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.beadNum$field = param1;
      }
      
      public function get beadNum() : uint
      {
         return this.beadNum$field;
      }
      
      public function clearAttachId() : void
      {
         this.hasField$0 &= 4294967287;
         this.attachId$field = new uint();
      }
      
      public function get hasAttachId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set attachId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.attachId$field = param1;
      }
      
      public function get attachId() : uint
      {
         return this.attachId$field;
      }
      
      public function clearIsAutoUse() : void
      {
         this.hasField$0 &= 4294967279;
         this.isAutoUse$field = new Boolean();
      }
      
      public function get hasIsAutoUse() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isAutoUse(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isAutoUse$field = param1;
      }
      
      public function get isAutoUse() : Boolean
      {
         return this.isAutoUse$field;
      }
      
      public function clearCurExp() : void
      {
         this.hasField$0 &= 4294967263;
         this.curExp$field = new uint();
      }
      
      public function get hasCurExp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set curExp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.curExp$field = param1;
      }
      
      public function get curExp() : uint
      {
         return this.curExp$field;
      }
      
      public function clearBuyTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.buyTime$field = new uint();
      }
      
      public function get hasBuyTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set buyTime(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.buyTime$field = param1;
      }
      
      public function get buyTime() : uint
      {
         return this.buyTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPoolId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.poolId$field);
         }
         if(this.hasCurEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.curEnergy$field);
         }
         if(this.hasBeadNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.beadNum$field);
         }
         if(this.hasAttachId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.attachId$field);
         }
         if(this.hasIsAutoUse)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.isAutoUse$field);
         }
         if(this.hasCurExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.curExp$field);
         }
         if(this.hasBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.poolId cannot be set twice.");
                  }
                  _loc3_++;
                  this.poolId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.curEnergy cannot be set twice.");
                  }
                  _loc4_++;
                  this.curEnergy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.beadNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.beadNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.attachId cannot be set twice.");
                  }
                  _loc6_++;
                  this.attachId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.isAutoUse cannot be set twice.");
                  }
                  _loc7_++;
                  this.isAutoUse = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.curExp cannot be set twice.");
                  }
                  _loc8_++;
                  this.curExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_EnergyInfo_SC.buyTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.buyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
