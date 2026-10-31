; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_6.c"
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
  %t = alloca [5 x i64], align 16
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
  %rem = srem i64 %2, 6588398
  store i64 %rem, ptr %a.addr, align 8
  %3 = load i64, ptr %a.addr, align 8
  %cmp1 = icmp sge i64 %3, 4941298
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %4 = load i64, ptr %a.addr, align 8
  %sub3 = sub nsw i64 %4, 6588398
  store i64 %sub3, ptr %a.addr, align 8
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %5 = load i64, ptr %a.addr, align 8
  %cmp5 = icmp sge i64 %5, 1647099
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end4
  %6 = load i64, ptr %a.addr, align 8
  %sub7 = sub nsw i64 3294199, %6
  store i64 %sub7, ptr %a.addr, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end4
  %7 = load i64, ptr %a.addr, align 8
  %8 = load i64, ptr %a.addr, align 8
  %mul = mul nsw i64 %7, %8
  %div = sdiv i64 %mul, 1048576
  store i64 %div, ptr %a2, align 8
  %9 = load i64, ptr %a.addr, align 8
  %arrayidx = getelementptr inbounds [5 x i64], ptr %t, i64 0, i64 0
  store i64 %9, ptr %arrayidx, align 16
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end8
  %10 = load i32, ptr %i, align 4
  %cmp9 = icmp slt i32 %10, 5
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, ptr %i, align 4
  %sub10 = sub nsw i32 %11, 1
  %idxprom = sext i32 %sub10 to i64
  %arrayidx11 = getelementptr inbounds [5 x i64], ptr %t, i64 0, i64 %idxprom
  %12 = load i64, ptr %arrayidx11, align 8
  %sub12 = sub nsw i64 0, %12
  %13 = load i64, ptr %a2, align 8
  %mul13 = mul nsw i64 %sub12, %13
  %14 = load i32, ptr %i, align 4
  %mul14 = mul nsw i32 2, %14
  %conv = sext i32 %mul14 to i64
  %15 = load i32, ptr %i, align 4
  %mul15 = mul nsw i32 2, %15
  %add = add nsw i32 %mul15, 1
  %conv16 = sext i32 %add to i64
  %mul17 = mul nsw i64 %conv, %conv16
  %mul18 = mul nsw i64 %mul17, 1048576
  %div19 = sdiv i64 %mul13, %mul18
  %16 = load i32, ptr %i, align 4
  %idxprom20 = sext i32 %16 to i64
  %arrayidx21 = getelementptr inbounds [5 x i64], ptr %t, i64 0, i64 %idxprom20
  store i64 %div19, ptr %arrayidx21, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, ptr %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 4, ptr %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc29, %for.end
  %18 = load i32, ptr %i, align 4
  %cmp23 = icmp sge i32 %18, 0
  br i1 %cmp23, label %for.body25, label %for.end30

for.body25:                                       ; preds = %for.cond22
  %19 = load i32, ptr %i, align 4
  %idxprom26 = sext i32 %19 to i64
  %arrayidx27 = getelementptr inbounds [5 x i64], ptr %t, i64 0, i64 %idxprom26
  %20 = load i64, ptr %arrayidx27, align 8
  %21 = load i64, ptr %res, align 8
  %add28 = add nsw i64 %21, %20
  store i64 %add28, ptr %res, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body25
  %22 = load i32, ptr %i, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, ptr %i, align 4
  br label %for.cond22, !llvm.loop !8

for.end30:                                        ; preds = %for.cond22
  %23 = load i64, ptr %res, align 8
  %add31 = add nsw i64 %23, 8
  %shr = ashr i64 %add31, 4
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
!8 = distinct !{!8, !7}
