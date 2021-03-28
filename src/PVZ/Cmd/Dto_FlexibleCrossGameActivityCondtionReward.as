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
   
   public final class Dto_FlexibleCrossGameActivityCondtionReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward";
      
      public static const LEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.level","level",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const PASSZOMBIEISLAND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.passzombieisland","passzombieisland",2 << 3 | WireType.VARINT);
      
      public static const NOTLOGINDAYS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.notlogindays","notlogindays",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const CONTINOUSLOGINDAYS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.continouslogindays","continouslogindays",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.reward","reward",100 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleCrossGameActivityReward);
      
      public static const CANTAKE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.cantake","cantake",101 << 3 | WireType.VARINT);
      
      public static const TAKETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward.taketime","taketime",102 << 3 | WireType.VARINT);
       
      
      private var level$field:Dto_Uint32Compare;
      
      private var passzombieisland$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var notlogindays$field:Dto_Uint32Compare;
      
      private var continouslogindays$field:Dto_Uint32Compare;
      
      public var reward:Dto_FlexibleCrossGameActivityReward;
      
      private var cantake$field:Boolean;
      
      private var taketime$field:uint;
      
      public function Dto_FlexibleCrossGameActivityCondtionReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleCrossGameActivityCondtionReward.$MessageID;
      }
      
      public function clearLevel() : void
      {
         this.level$field = null;
      }
      
      public function get hasLevel() : Boolean
      {
         return this.level$field != null;
      }
      
      public function set level(param1:Dto_Uint32Compare) : void
      {
         this.level$field = param1;
      }
      
      public function get level() : Dto_Uint32Compare
      {
         return this.level$field;
      }
      
      public function clearPasszombieisland() : void
      {
         this.hasField$0 &= 4294967294;
         this.passzombieisland$field = new Boolean();
      }
      
      public function get hasPasszombieisland() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set passzombieisland(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.passzombieisland$field = param1;
      }
      
      public function get passzombieisland() : Boolean
      {
         return this.passzombieisland$field;
      }
      
      public function clearNotlogindays() : void
      {
         this.notlogindays$field = null;
      }
      
      public function get hasNotlogindays() : Boolean
      {
         return this.notlogindays$field != null;
      }
      
      public function set notlogindays(param1:Dto_Uint32Compare) : void
      {
         this.notlogindays$field = param1;
      }
      
      public function get notlogindays() : Dto_Uint32Compare
      {
         return this.notlogindays$field;
      }
      
      public function clearContinouslogindays() : void
      {
         this.continouslogindays$field = null;
      }
      
      public function get hasContinouslogindays() : Boolean
      {
         return this.continouslogindays$field != null;
      }
      
      public function set continouslogindays(param1:Dto_Uint32Compare) : void
      {
         this.continouslogindays$field = param1;
      }
      
      public function get continouslogindays() : Dto_Uint32Compare
      {
         return this.continouslogindays$field;
      }
      
      public function clearCantake() : void
      {
         this.hasField$0 &= 4294967293;
         this.cantake$field = new Boolean();
      }
      
      public function get hasCantake() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cantake(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.cantake$field = param1;
      }
      
      public function get cantake() : Boolean
      {
         return this.cantake$field;
      }
      
      public function clearTaketime() : void
      {
         this.hasField$0 &= 4294967291;
         this.taketime$field = new uint();
      }
      
      public function get hasTaketime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set taketime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.taketime$field = param1;
      }
      
      public function get taketime() : uint
      {
         return this.taketime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.level$field);
         }
         if(this.hasPasszombieisland)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.passzombieisland$field);
         }
         if(this.hasNotlogindays)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.notlogindays$field);
         }
         if(this.hasContinouslogindays)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.continouslogindays$field);
         }
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,100);
         WriteUtils.write$TYPE_MESSAGE(param1,this.reward);
         if(this.hasCantake)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_BOOL(param1,this.cantake$field);
         }
         if(this.hasTaketime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.taketime$field);
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
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.level);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.passzombieisland cannot be set twice.");
                  }
                  _loc4_++;
                  this.passzombieisland = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.notlogindays cannot be set twice.");
                  }
                  _loc5_++;
                  this.notlogindays = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.notlogindays);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.continouslogindays cannot be set twice.");
                  }
                  _loc6_++;
                  this.continouslogindays = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.continouslogindays);
                  break;
               case 100:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.reward cannot be set twice.");
                  }
                  _loc7_++;
                  this.reward = new Dto_FlexibleCrossGameActivityReward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               case 101:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.cantake cannot be set twice.");
                  }
                  _loc8_++;
                  this.cantake = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 102:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityCondtionReward.taketime cannot be set twice.");
                  }
                  _loc9_++;
                  this.taketime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
