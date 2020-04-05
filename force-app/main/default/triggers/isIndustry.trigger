trigger isIndustry on Account (before insert) {
    for (Account act:Trigger.new)
        {
            if (act.Industry == 'Education')
                {
                    act.addError('We do not have this Industry - Education');
                }
        }
    }