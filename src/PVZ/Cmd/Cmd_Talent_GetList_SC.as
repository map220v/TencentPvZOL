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
   
   public final class Cmd_Talent_GetList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Talent_GetList_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Talent_GetList_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const UNLOCKPLANTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Talent_GetList_SC.unlockPlantList","unlockPlantList",3 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const TALENTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Talent_GetList_SC.talentList","talentList",4 << 3 | WireType.LENGTH_DELIMITED,Dto_TalentInfo);
       
      
      public var stageId:uint;
      
      public var unlockPlantList:Array;
      
      public var talentList:Array;
      
      public function Cmd_Talent_GetList_SC()
      {
         this.unlockPlantList = [];
         this.talentList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Talent_GetList_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.stageId);
         var _loc2_:uint = 0;
         while(_loc2_ < this.unlockPlantList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.unlockPlantList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.talentList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.talentList[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_Talent_GetList_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.unlockPlantList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 4:
                  this.talentList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TalentInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
