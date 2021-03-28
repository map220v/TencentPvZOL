package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_UpgradeGeneFactor_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_UpgradeGeneFactor_SC";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_UpgradeGeneFactor_SC.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const CARDGENE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_UpgradeGeneFactor_SC.cardGene","cardGene",2 << 3 | WireType.LENGTH_DELIMITED,Dto_CardGene);
      
      public static const SUCCESS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_UpgradeGeneFactor_SC.success","success",3 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      private var cardGene$field:Dto_CardGene;
      
      private var success$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_UpgradeGeneFactor_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_UpgradeGeneFactor_SC.$MessageID;
      }
      
      public function clearCardUId() : void
      {
         this.cardUId$field = null;
      }
      
      public function get hasCardUId() : Boolean
      {
         return this.cardUId$field != null;
      }
      
      public function set cardUId(param1:Int64) : void
      {
         this.cardUId$field = param1;
      }
      
      public function get cardUId() : Int64
      {
         return this.cardUId$field;
      }
      
      public function clearCardGene() : void
      {
         this.cardGene$field = null;
      }
      
      public function get hasCardGene() : Boolean
      {
         return this.cardGene$field != null;
      }
      
      public function set cardGene(param1:Dto_CardGene) : void
      {
         this.cardGene$field = param1;
      }
      
      public function get cardGene() : Dto_CardGene
      {
         return this.cardGene$field;
      }
      
      public function clearSuccess() : void
      {
         this.hasField$0 &= 4294967294;
         this.success$field = new Boolean();
      }
      
      public function get hasSuccess() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set success(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.success$field = param1;
      }
      
      public function get success() : Boolean
      {
         return this.success$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         if(this.hasCardGene)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardGene$field);
         }
         if(this.hasSuccess)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.success$field);
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
                     throw new IOError("Bad data format: Cmd_Card_UpgradeGeneFactor_SC.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_UpgradeGeneFactor_SC.cardGene cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardGene = new Dto_CardGene();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardGene);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_UpgradeGeneFactor_SC.success cannot be set twice.");
                  }
                  _loc5_++;
                  this.success = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
