; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_6.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %n = alloca [2 x i32], align 4
  %q = alloca [2 x i32], align 4
  %red = alloca i32, align 4
  %i = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %arrayinit.begin = getelementptr inbounds [2 x i32], ptr %n, i64 0, i64 0
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  store i32 %add, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %mul3 = mul nsw i32 2, %and2
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add nsw i32 %mul3, %and4
  %shr = ashr i32 %add5, 5
  store i32 %shr, ptr %arrayinit.element, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %q, i8 0, i64 8, i1 false)
  %4 = load i32, ptr %c0.addr, align 4
  %shr6 = ashr i32 %4, 10
  %mul7 = mul nsw i32 2, %shr6
  %5 = load i32, ptr %c1.addr, align 4
  %shr8 = ashr i32 %5, 10
  %add9 = add nsw i32 %mul7, %shr8
  store i32 %add9, ptr %red, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 2
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 16, ptr %bit, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body
  %7 = load i32, ptr %bit, align 4
  %cmp11 = icmp ne i32 %7, 0
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond10
  %8 = load i32, ptr %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [2 x i32], ptr %n, i64 0, i64 %idxprom
  %9 = load i32, ptr %arrayidx, align 4
  %10 = load i32, ptr %bit, align 4
  %mul13 = mul nsw i32 3, %10
  %cmp14 = icmp sge i32 %9, %mul13
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body12
  %11 = load i32, ptr %bit, align 4
  %mul15 = mul nsw i32 3, %11
  %12 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %12 to i64
  %arrayidx17 = getelementptr inbounds [2 x i32], ptr %n, i64 0, i64 %idxprom16
  %13 = load i32, ptr %arrayidx17, align 4
  %sub = sub nsw i32 %13, %mul15
  store i32 %sub, ptr %arrayidx17, align 4
  %14 = load i32, ptr %bit, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom18 = sext i32 %15 to i64
  %arrayidx19 = getelementptr inbounds [2 x i32], ptr %q, i64 0, i64 %idxprom18
  %16 = load i32, ptr %arrayidx19, align 4
  %add20 = add nsw i32 %16, %14
  store i32 %add20, ptr %arrayidx19, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body12
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i32, ptr %bit, align 4
  %shr21 = ashr i32 %17, 1
  store i32 %shr21, ptr %bit, align 4
  br label %for.cond10, !llvm.loop !6

for.end:                                          ; preds = %for.cond10
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %18 = load i32, ptr %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end23:                                        ; preds = %for.cond
  %19 = load i32, ptr %red, align 4
  %div = sdiv i32 %19, 3
  %mul24 = mul nsw i32 %div, 1024
  %arrayidx25 = getelementptr inbounds [2 x i32], ptr %q, i64 0, i64 1
  %20 = load i32, ptr %arrayidx25, align 4
  %mul26 = mul nsw i32 %20, 32
  %add27 = add nsw i32 %mul24, %mul26
  %arrayidx28 = getelementptr inbounds [2 x i32], ptr %q, i64 0, i64 0
  %21 = load i32, ptr %arrayidx28, align 4
  %add29 = add nsw i32 %add27, %21
  ret i32 %add29
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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
