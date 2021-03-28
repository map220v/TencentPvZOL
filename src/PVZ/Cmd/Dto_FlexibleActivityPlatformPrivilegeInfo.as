package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivityPlatformPrivilegeInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo";
      
      public static const IPLATFORMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo.iPlatformId","iPlatformId",1 << 3 | WireType.VARINT);
      
      public static const DIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo.diamond","diamond",2 << 3 | WireType.VARINT);
      
      public static const DIAMONDLEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo.diamondLevel","diamondLevel",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const GROWLEVEL3366:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo.growLevel3366","growLevel3366",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const WDPID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo.wdPid","wdPid",5 << 3 | WireType.VARINT);
       
      
      private var iPlatformId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var diamond$field:uint;
      
      private var diamondLevel$field:Dto_Uint32Compare;
      
      private var growLevel3366$field:Dto_Uint32Compare;
      
      private var wdPid$field:int;
      
      public function Dto_FlexibleActivityPlatformPrivilegeInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityPlatformPrivilegeInfo.$MessageID;
      }
      
      public function clearIPlatformId() : void
      {
         this.hasField$0 &= 4294967294;
         this.iPlatformId$field = new uint();
      }
      
      public function get hasIPlatformId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iPlatformId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iPlatformId$field = param1;
      }
      
      public function get iPlatformId() : uint
      {
         return this.iPlatformId$field;
      }
      
      public function clearDiamond() : void
      {
         this.hasField$0 &= 4294967293;
         this.diamond$field = new uint();
      }
      
      public function get hasDiamond() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set diamond(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.diamond$field = param1;
      }
      
      public function get diamond() : uint
      {
         return this.diamond$field;
      }
      
      public function clearDiamondLevel() : void
      {
         this.diamondLevel$field = null;
      }
      
      public function get hasDiamondLevel() : Boolean
      {
         return this.diamondLevel$field != null;
      }
      
      public function set diamondLevel(param1:Dto_Uint32Compare) : void
      {
         this.diamondLevel$field = param1;
      }
      
      public function get diamondLevel() : Dto_Uint32Compare
      {
         return this.diamondLevel$field;
      }
      
      public function clearGrowLevel3366() : void
      {
         this.growLevel3366$field = null;
      }
      
      public function get hasGrowLevel3366() : Boolean
      {
         return this.growLevel3366$field != null;
      }
      
      public function set growLevel3366(param1:Dto_Uint32Compare) : void
      {
         this.growLevel3366$field = param1;
      }
      
      public function get growLevel3366() : Dto_Uint32Compare
      {
         return this.growLevel3366$field;
      }
      
      public function clearWdPid() : void
      {
         this.hasField$0 &= 4294967291;
         this.wdPid$field = new int();
      }
      
      public function get hasWdPid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set wdPid(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.wdPid$field = param1;
      }
      
      public function get wdPid() : int
      {
         return this.wdPid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIPlatformId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.iPlatformId$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.diamond$field);
         }
         if(this.hasDiamondLevel)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamondLevel$field);
         }
         if(this.hasGrowLevel3366)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.growLevel3366$field);
         }
         if(this.hasWdPid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT32(param1,this.wdPid$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilegeInfo.iPlatformId cannot be set twice.");
                  }
                  _loc3_++;
                  this.iPlatformId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilegeInfo.diamond cannot be set twice.");
                  }
                  _loc4_++;
                  this.diamond = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilegeInfo.diamondLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.diamondLevel = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamondLevel);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilegeInfo.growLevel3366 cannot be set twice.");
                  }
                  _loc6_++;
                  this.growLevel3366 = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.growLevel3366);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityPlatformPrivilegeInfo.wdPid cannot be set twice.");
                  }
                  _loc7_++;
                  this.wdPid = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
