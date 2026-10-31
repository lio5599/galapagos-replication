; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @int_sin(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @int_sin(i64 noundef %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  %m = alloca i64, align 8
  %a2 = alloca i64, align 8
  %res = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, ptr %a.addr, align 8
  store i64 0, ptr %res, align 8
  %0 = load i64, ptr %a.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64, ptr %a.addr, align 8
  %sub = sub nsw i64 3294199, %1
  store i64 %sub, ptr %a.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64, ptr %a.addr, align 8
  %3 = load i64, ptr %a.addr, align 8
  %div = sdiv i64 %3, 6588398
  %mul = mul nsw i64 %div, 6588398
  %sub1 = sub nsw i64 %2, %mul
  store i64 %sub1, ptr %m, align 8
  %4 = load i64, ptr %m, align 8
  %cmp2 = icmp sge i64 %4, 4941298
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %5 = load i64, ptr %m, align 8
  %sub4 = sub nsw i64 %5, 6588398
  store i64 %sub4, ptr %m, align 8
  br label %if.end9

if.else:                                          ; preds = %if.end
  %6 = load i64, ptr %m, align 8
  %cmp5 = icmp sge i64 %6, 1647099
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.else
  %7 = load i64, ptr %m, align 8
  %sub7 = sub nsw i64 3294199, %7
  store i64 %sub7, ptr %m, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then3
  %8 = load i64, ptr %m, align 8
  %9 = load i64, ptr %m, align 8
  %mul10 = mul nsw i64 %8, %9
  %div11 = sdiv i64 %mul10, 1048576
  store i64 %div11, ptr %a2, align 8
  store i32 2, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %10 = load i32, ptr %i, align 4
  %cmp12 = icmp slt i32 %10, 11
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i64, ptr %m, align 8
  %12 = load i64, ptr %res, align 8
  %add = add nsw i64 %12, %11
  store i64 %add, ptr %res, align 8
  %13 = load i64, ptr %m, align 8
  %sub13 = sub nsw i64 0, %13
  %14 = load i64, ptr %a2, align 8
  %mul14 = mul nsw i64 %sub13, %14
  %15 = load i32, ptr %i, align 4
  %mul15 = mul nsw i32 1048576, %15
  %16 = load i32, ptr %i, align 4
  %add16 = add nsw i32 %16, 1
  %mul17 = mul nsw i32 %mul15, %add16
  %conv = sext i32 %mul17 to i64
  %div18 = sdiv i64 %mul14, %conv
  store i64 %div18, ptr %m, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, ptr %i, align 4
  %add19 = add nsw i32 %17, 2
  store i32 %add19, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %18 = load i64, ptr %res, align 8
  %add20 = add nsw i64 %18, 8
  %shr = ashr i64 %add20, 4
  ret i64 %shr
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
