package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ZombieIsland_SyncFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ZombieIsland_SyncFormation_SC";
      
      public static const PLANTFORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ZombieIsland_SyncFormation_SC.plantFormation","plantFormation",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
       
      
      private var plantFormation$field:Dto_FormationInfo;
      
      public function Cmd_ZombieIsland_SyncFormation_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ZombieIsland_SyncFormation_SC.$MessageID;
      }
      
      public function clearPlantFormation() : void
      {
         this.plantFormation$field = null;
      }
      
      public function get hasPlantFormation() : Boolean
      {
         return this.plantFormation$field != null;
      }
      
      public function set plantFormation(param1:Dto_FormationInfo) : void
      {
         this.plantFormation$field = param1;
      }
      
      public function get plantFormation() : Dto_FormationInfo
      {
         return this.plantFormation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPlantFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantFormation$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ZombieIsland_SyncFormation_SC.plantFormation cannot be set twice.");
                  }
                  _loc3_++;
                  this.plantFormation = new Dto_FormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.plantFormation);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
