; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_6.c"
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
  %sums = alloca [3 x i32], align 4
  %quotients = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %quotients, i8 0, i64 12, i1 false)
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  %arrayidx = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 0
  store i32 %add, ptr %arrayidx, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %mul3 = mul nsw i32 2, %and2
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add nsw i32 %mul3, %and4
  %shr = ashr i32 %add5, 5
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 1
  store i32 %shr, ptr %arrayidx6, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul8 = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr9 = ashr i32 %5, 10
  %add10 = add nsw i32 %mul8, %shr9
  %arrayidx11 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 2
  store i32 %add10, ptr %arrayidx11, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %7 = load i32, ptr %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 %idxprom
  %8 = load i32, ptr %arrayidx12, align 4
  %cmp13 = icmp sge i32 %8, 3
  br i1 %cmp13, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, ptr %i, align 4
  %idxprom14 = sext i32 %9 to i64
  %arrayidx15 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 %idxprom14
  %10 = load i32, ptr %arrayidx15, align 4
  %sub = sub nsw i32 %10, 3
  store i32 %sub, ptr %arrayidx15, align 4
  %11 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %11 to i64
  %arrayidx17 = getelementptr inbounds [3 x i32], ptr %quotients, i64 0, i64 %idxprom16
  %12 = load i32, ptr %arrayidx17, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, ptr %arrayidx17, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  br label %while.cond18

while.cond18:                                     ; preds = %while.body22, %while.end
  %13 = load i32, ptr %i, align 4
  %idxprom19 = sext i32 %13 to i64
  %arrayidx20 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 %idxprom19
  %14 = load i32, ptr %arrayidx20, align 4
  %cmp21 = icmp sle i32 %14, -3
  br i1 %cmp21, label %while.body22, label %while.end28

while.body22:                                     ; preds = %while.cond18
  %15 = load i32, ptr %i, align 4
  %idxprom23 = sext i32 %15 to i64
  %arrayidx24 = getelementptr inbounds [3 x i32], ptr %sums, i64 0, i64 %idxprom23
  %16 = load i32, ptr %arrayidx24, align 4
  %add25 = add nsw i32 %16, 3
  store i32 %add25, ptr %arrayidx24, align 4
  %17 = load i32, ptr %i, align 4
  %idxprom26 = sext i32 %17 to i64
  %arrayidx27 = getelementptr inbounds [3 x i32], ptr %quotients, i64 0, i64 %idxprom26
  %18 = load i32, ptr %arrayidx27, align 4
  %dec = add nsw i32 %18, -1
  store i32 %dec, ptr %arrayidx27, align 4
  br label %while.cond18, !llvm.loop !8

while.end28:                                      ; preds = %while.cond18
  br label %for.inc

for.inc:                                          ; preds = %while.end28
  %19 = load i32, ptr %i, align 4
  %inc29 = add nsw i32 %19, 1
  store i32 %inc29, ptr %i, align 4
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %arrayidx30 = getelementptr inbounds [3 x i32], ptr %quotients, i64 0, i64 2
  %20 = load i32, ptr %arrayidx30, align 4
  %mul31 = mul nsw i32 %20, 1024
  %arrayidx32 = getelementptr inbounds [3 x i32], ptr %quotients, i64 0, i64 1
  %21 = load i32, ptr %arrayidx32, align 4
  %mul33 = mul nsw i32 %21, 32
  %add34 = add nsw i32 %mul31, %mul33
  %arrayidx35 = getelementptr inbounds [3 x i32], ptr %quotients, i64 0, i64 0
  %22 = load i32, ptr %arrayidx35, align 4
  %add36 = add nsw i32 %add34, %22
  ret i32 %add36
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
!9 = distinct !{!9, !7}
