; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/4_int_sin_3.c"
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
  %P = alloca i64, align 8
  %x = alloca i64, align 8
  %x2 = alloca i64, align 8
  %term = alloca i64, align 8
  %sum = alloca i64, align 8
  %n = alloca i32, align 4
  store i64 %a, ptr %a.addr, align 8
  store i64 3294199, ptr %P, align 8
  store i64 0, ptr %sum, align 8
  %0 = load i64, ptr %a.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, ptr %a.addr, align 8
  %sub = sub nsw i64 3294199, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64, ptr %a.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %2, %cond.false ]
  store i64 %cond, ptr %x, align 8
  %3 = load i64, ptr %x, align 8
  %rem = srem i64 %3, 6588398
  store i64 %rem, ptr %x, align 8
  %4 = load i64, ptr %x, align 8
  %cmp1 = icmp sge i64 %4, 4941298
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %5 = load i64, ptr %x, align 8
  %sub2 = sub nsw i64 %5, 6588398
  store i64 %sub2, ptr %x, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %6 = load i64, ptr %x, align 8
  %cmp3 = icmp sge i64 %6, 1647099
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %7 = load i64, ptr %x, align 8
  %sub5 = sub nsw i64 3294199, %7
  store i64 %sub5, ptr %x, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %8 = load i64, ptr %x, align 8
  %9 = load i64, ptr %x, align 8
  %mul = mul nsw i64 %8, %9
  %shr = ashr i64 %mul, 20
  store i64 %shr, ptr %x2, align 8
  %10 = load i64, ptr %x, align 8
  store i64 %10, ptr %term, align 8
  store i32 1, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %11 = load i32, ptr %n, align 4
  %cmp7 = icmp sle i32 %11, 5
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i64, ptr %term, align 8
  %13 = load i64, ptr %sum, align 8
  %add = add nsw i64 %13, %12
  store i64 %add, ptr %sum, align 8
  %14 = load i64, ptr %term, align 8
  %15 = load i64, ptr %x2, align 8
  %mul8 = mul nsw i64 %14, %15
  %16 = load i32, ptr %n, align 4
  %mul9 = mul nsw i32 2, %16
  %conv = sext i32 %mul9 to i64
  %17 = load i32, ptr %n, align 4
  %mul10 = mul nsw i32 2, %17
  %add11 = add nsw i32 %mul10, 1
  %conv12 = sext i32 %add11 to i64
  %mul13 = mul nsw i64 %conv, %conv12
  %shl = shl i64 %mul13, 20
  %div = sdiv i64 %mul8, %shl
  %sub14 = sub nsw i64 0, %div
  store i64 %sub14, ptr %term, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %n, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %n, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i64, ptr %sum, align 8
  %add15 = add nsw i64 %19, 8
  %shr16 = ashr i64 %add15, 4
  ret i64 %shr16
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
