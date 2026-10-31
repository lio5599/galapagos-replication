; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.mix.masks = private unnamed_addr constant [2 x i32] [i32 31, i32 992], align 4
@__const.mix.shifts = private unnamed_addr constant [2 x i32] [i32 0, i32 5], align 4
@__const.mix.mults = private unnamed_addr constant [2 x i32] [i32 1, i32 32], align 4

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
  %masks = alloca [2 x i32], align 4
  %shifts = alloca [2 x i32], align 4
  %mults = alloca [2 x i32], align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %masks, ptr align 4 @__const.mix.masks, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %shifts, ptr align 4 @__const.mix.shifts, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %mults, ptr align 4 @__const.mix.mults, i64 8, i1 false)
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %c0.addr, align 4
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [2 x i32], ptr %masks, i64 0, i64 %idxprom
  %3 = load i32, ptr %arrayidx, align 4
  %and = and i32 %1, %3
  %mul = mul nsw i32 2, %and
  %4 = load i32, ptr %c1.addr, align 4
  %5 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [2 x i32], ptr %masks, i64 0, i64 %idxprom1
  %6 = load i32, ptr %arrayidx2, align 4
  %and3 = and i32 %4, %6
  %add = add nsw i32 %mul, %and3
  %7 = load i32, ptr %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [2 x i32], ptr %shifts, i64 0, i64 %idxprom4
  %8 = load i32, ptr %arrayidx5, align 4
  %shr = ashr i32 %add, %8
  store i32 %shr, ptr %s, align 4
  %9 = load i32, ptr %s, align 4
  %div = sdiv i32 %9, 3
  %10 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds [2 x i32], ptr %mults, i64 0, i64 %idxprom6
  %11 = load i32, ptr %arrayidx7, align 4
  %mul8 = mul nsw i32 %div, %11
  %12 = load i32, ptr %result, align 4
  %add9 = add nsw i32 %12, %mul8
  store i32 %add9, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, ptr %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %14 = load i32, ptr %c0.addr, align 4
  %shr10 = ashr i32 %14, 10
  %mul11 = mul nsw i32 2, %shr10
  %15 = load i32, ptr %c1.addr, align 4
  %shr12 = ashr i32 %15, 10
  %add13 = add nsw i32 %mul11, %shr12
  %div14 = sdiv i32 %add13, 3
  %mul15 = mul nsw i32 %div14, 1024
  %16 = load i32, ptr %result, align 4
  %add16 = add nsw i32 %16, %mul15
  store i32 %add16, ptr %result, align 4
  %17 = load i32, ptr %result, align 4
  ret i32 %17
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
