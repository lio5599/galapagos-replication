; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
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
  %retval = alloca i32, align 4
  %a_val.addr = alloca i8, align 1
  %decoded = alloca i32, align 4
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %shift = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %decoded, align 4
  %1 = load i32, ptr %decoded, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %decoded, align 4
  %and1 = and i32 %2, 15
  %mul = mul nsw i32 %and1, 16
  %add = add nsw i32 %mul, 8
  store i32 %add, ptr %magnitude, align 4
  %3 = load i32, ptr %segment, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %decoded, align 4
  %and3 = and i32 %4, 128
  %tobool = icmp ne i32 %and3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load i32, ptr %magnitude, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %6 = load i32, ptr %magnitude, align 4
  %sub = sub nsw i32 0, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i32, ptr %magnitude, align 4
  %add4 = add nsw i32 %7, 256
  store i32 %add4, ptr %magnitude, align 4
  %8 = load i32, ptr %segment, align 4
  %sub5 = sub nsw i32 %8, 1
  store i32 %sub5, ptr %shift, align 4
  %9 = load i32, ptr %shift, align 4
  %and6 = and i32 %9, 1
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  %10 = load i32, ptr %magnitude, align 4
  %shl = shl i32 %10, 1
  store i32 %shl, ptr %magnitude, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %11 = load i32, ptr %shift, align 4
  %and10 = and i32 %11, 2
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end9
  %12 = load i32, ptr %magnitude, align 4
  %shl13 = shl i32 %12, 2
  store i32 %shl13, ptr %magnitude, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end9
  %13 = load i32, ptr %shift, align 4
  %and15 = and i32 %13, 4
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end14
  %14 = load i32, ptr %magnitude, align 4
  %shl18 = shl i32 %14, 4
  store i32 %shl18, ptr %magnitude, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end14
  %15 = load i32, ptr %decoded, align 4
  %and20 = and i32 %15, 128
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %if.end19
  %16 = load i32, ptr %magnitude, align 4
  br label %cond.end25

cond.false23:                                     ; preds = %if.end19
  %17 = load i32, ptr %magnitude, align 4
  %sub24 = sub nsw i32 0, %17
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false23, %cond.true22
  %cond26 = phi i32 [ %16, %cond.true22 ], [ %sub24, %cond.false23 ]
  store i32 %cond26, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end25, %cond.end
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
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
