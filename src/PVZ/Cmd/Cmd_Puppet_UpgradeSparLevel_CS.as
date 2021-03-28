package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Puppet_UpgradeSparLevel_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_CS";
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_CS.baseId","baseId",1 << 3 | WireType.VARINT);
      
      public static const SPARTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_CS.sparType","sparType",2 << 3 | WireType.VARINT);
      
      public static const MAXUPGRADECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_CS.maxUpgradeCount","maxUpgradeCount",3 << 3 | WireType.VARINT);
       
      
      private var baseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sparType$field:uint;
      
      private var maxUpgradeCount$field:uint;
      
      public function Cmd_Puppet_UpgradeSparLevel_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Puppet_UpgradeSparLevel_CS.$MessageID;
      }
      
      public function clearBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.baseId$field = new uint();
      }
      
      public function get hasBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set baseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.baseId$field = param1;
      }
      
      public function get baseId() : uint
      {
         return this.baseId$field;
      }
      
      public function clearSparType() : void
      {
         this.hasField$0 &= 4294967293;
         this.sparType$field = new uint();
      }
      
      public function get hasSparType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sparType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sparType$field = param1;
      }
      
      public function get sparType() : uint
      {
         return this.sparType$field;
      }
      
      public function clearMaxUpgradeCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.maxUpgradeCount$field = new uint();
      }
      
      public function get hasMaxUpgradeCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set maxUpgradeCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.maxUpgradeCount$field = param1;
      }
      
      public function get maxUpgradeCount() : uint
      {
         return this.maxUpgradeCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.baseId$field);
         }
         if(this.hasSparType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.sparType$field);
         }
         if(this.hasMaxUpgradeCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.maxUpgradeCount$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeSparLevel_CS.baseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeSparLevel_CS.sparType cannot be set twice.");
                  }
                  _loc4_++;
                  this.sparType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeSparLevel_CS.maxUpgradeCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxUpgradeCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
