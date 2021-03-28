package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_RefreshBuffInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_RefreshBuffInfo_SC";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_RefreshBuffInfo_SC.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const BUFF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshBuffInfo_SC.buff","buff",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightBuffInfo);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var buff$field:Dto_ExpeditionFightBuffInfo;
      
      public function Cmd_ExpeditionFight_RefreshBuffInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_RefreshBuffInfo_SC.$MessageID;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearBuff() : void
      {
         this.buff$field = null;
      }
      
      public function get hasBuff() : Boolean
      {
         return this.buff$field != null;
      }
      
      public function set buff(param1:Dto_ExpeditionFightBuffInfo) : void
      {
         this.buff$field = param1;
      }
      
      public function get buff() : Dto_ExpeditionFightBuffInfo
      {
         return this.buff$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         if(this.hasBuff)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buff$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshBuffInfo_SC.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshBuffInfo_SC.buff cannot be set twice.");
                  }
                  _loc4_++;
                  this.buff = new Dto_ExpeditionFightBuffInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.buff);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
