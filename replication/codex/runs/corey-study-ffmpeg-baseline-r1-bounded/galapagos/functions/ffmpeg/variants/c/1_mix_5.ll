; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1-bounded/functions/ffmpeg/variants/c/1_mix_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.mix.weights = private unnamed_addr constant [3 x i32] [i32 1, i32 32, i32 1024], align 4

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
  %a = alloca [3 x i32], align 4
  %b = alloca [3 x i32], align 4
  %weights = alloca [3 x i32], align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %arrayinit.begin = getelementptr inbounds [3 x i32], ptr %a, i64 0, i64 0
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %1 = load i32, ptr %c0.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  store i32 %shr, ptr %arrayinit.element, align 4
  %arrayinit.element2 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %2 = load i32, ptr %c0.addr, align 4
  %shr3 = ashr i32 %2, 10
  store i32 %shr3, ptr %arrayinit.element2, align 4
  %arrayinit.begin4 = getelementptr inbounds [3 x i32], ptr %b, i64 0, i64 0
  %3 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %3, 31
  store i32 %and5, ptr %arrayinit.begin4, align 4
  %arrayinit.element6 = getelementptr inbounds i32, ptr %arrayinit.begin4, i64 1
  %4 = load i32, ptr %c1.addr, align 4
  %and7 = and i32 %4, 992
  %shr8 = ashr i32 %and7, 5
  store i32 %shr8, ptr %arrayinit.element6, align 4
  %arrayinit.element9 = getelementptr inbounds i32, ptr %arrayinit.element6, i64 1
  %5 = load i32, ptr %c1.addr, align 4
  %shr10 = ashr i32 %5, 10
  store i32 %shr10, ptr %arrayinit.element9, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %weights, ptr align 4 @__const.mix.weights, i64 12, i1 false)
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr %a, i64 0, i64 %idxprom
  %8 = load i32, ptr %arrayidx, align 4
  %mul = mul nsw i32 2, %8
  %9 = load i32, ptr %i, align 4
  %idxprom11 = sext i32 %9 to i64
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %b, i64 0, i64 %idxprom11
  %10 = load i32, ptr %arrayidx12, align 4
  %add = add nsw i32 %mul, %10
  %div = sdiv i32 %add, 3
  %11 = load i32, ptr %i, align 4
  %idxprom13 = sext i32 %11 to i64
  %arrayidx14 = getelementptr inbounds [3 x i32], ptr %weights, i64 0, i64 %idxprom13
  %12 = load i32, ptr %arrayidx14, align 4
  %mul15 = mul nsw i32 %div, %12
  %13 = load i32, ptr %result, align 4
  %add16 = add nsw i32 %13, %mul15
  store i32 %add16, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %result, align 4
  ret i32 %15
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
