; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/0_alaw_to_s16_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %shift = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  store i32 0, ptr %shift, align 4
  %2 = load i32, ptr %x, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %t, align 4
  %3 = load i32, ptr %seg, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %add3 = add nsw i32 %4, 256
  store i32 %add3, ptr %t, align 4
  %5 = load i32, ptr %seg, align 4
  %sub = sub nsw i32 %5, 1
  store i32 %sub, ptr %shift, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, ptr %shift, align 4
  %and4 = and i32 %6, 1
  %tobool = icmp ne i32 %and4, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %7 = load i32, ptr %t, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, ptr %t, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %8 = load i32, ptr %shift, align 4
  %and7 = and i32 %8, 2
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %9 = load i32, ptr %t, align 4
  %shl10 = shl i32 %9, 2
  store i32 %shl10, ptr %t, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  %10 = load i32, ptr %shift, align 4
  %and12 = and i32 %10, 4
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end11
  %11 = load i32, ptr %t, align 4
  %shl15 = shl i32 %11, 4
  store i32 %shl15, ptr %t, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.end11
  %12 = load i32, ptr %x, align 4
  %and17 = and i32 %12, 128
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %13 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  %14 = load i32, ptr %t, align 4
  %sub19 = sub nsw i32 0, %14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %sub19, %cond.false ]
  ret i32 %cond
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
