; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/1_iec958_parity_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-cot-r1/functions/alsa-lib/variants/c/1_iec958_parity_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @iec958_parity(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @iec958_parity(i32 noundef %data) #0 {
entry:
  %data.addr = alloca i32, align 4
  %mask = alloca i64, align 8
  %parity = alloca i32, align 4
  store i32 %data, ptr %data.addr, align 4
  store i32 0, ptr %parity, align 4
  store i64 16, ptr %mask, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %mask, align 8
  %cmp = icmp ule i64 %0, 1073741824
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %data.addr, align 4
  %conv = zext i32 %1 to i64
  %2 = load i64, ptr %mask, align 8
  %and = and i64 %conv, %2
  %cmp1 = icmp ne i64 %and, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, ptr %parity, align 4
  %xor = xor i32 %3, 1
  store i32 %xor, ptr %parity, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i64, ptr %mask, align 8
  %shl = shl i64 %4, 1
  store i64 %shl, ptr %mask, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %5 = load i32, ptr %parity, align 4
  ret i32 %5
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
